#!/usr/bin/env python3
"""
Ziggurat build tool (ORGANIZER ONLY).

Assembles the VM program that implements the serial check, runs it forward on
the intended serial to obtain the CMP targets, encrypts the bytecode with the
same rolling-key scheme the binary decrypts with at runtime, derives the flag
keystream from the serial, and emits ziggurat_data.h.

Nothing here is secret math the player can't rediscover -- it just keeps the C
source and the reference solver in perfect lockstep.
"""

import struct

MASK = 0xFFFFFFFF

# ---- intended serial (24 printable bytes). Players recover this, they don't guess it.
SERIAL = b"Zigg7-St3pped//Rite//x!"  # will be padded/checked to 24 below
SERIAL = b"Zigg7St3pped//Rite//x!23"
assert len(SERIAL) == 24, len(SERIAL)
assert all(0x21 <= c <= 0x7e for c in SERIAL), "serial must be printable"

FLAG = b"CTF{each_lay3r_c0nceals_the_next_one_below}"

ODD = 0x9E3779B1  # odd -> invertible under mul mod 2^32
ROUNDS = 4
# round constants RC[round][lane]
RC = [
    [0xA1B2C3D4, 0x1337BEEF, 0xCAFEBABE, 0xDEADC0DE, 0x0BADF00D, 0xFEEDFACE],
    [0x51EDE19F, 0x9D2C5680, 0xE6546B64, 0x27D4EB2F, 0x165667B1, 0x85EBCA6B],
    [0xC2B2AE35, 0xFF51AFD7, 0xED558CCD, 0x1B873593, 0xCC9E2D51, 0x64F5D5B3],
    [0x2545F491, 0x4F6CDD1D, 0xB55A4F09, 0x9FB21C65, 0x71374491, 0x428A2F98],
]

# ---- opcodes
LOADW, LOADI, MOV, ADD, SUB, XOR, MUL, ROL, ROR, ADDI, CMP, HALT = range(1, 13)

def rotl32(x, n):
    n &= 31
    return ((x << n) | (x >> (32 - n))) & MASK

def rotr32(x, n):
    n &= 31
    return ((x >> n) | (x << (32 - n))) & MASK

# ---------------------------------------------------------------- assembler
prog = bytearray()
def emit(*bs):
    prog.extend(bs)
def emit_imm(op, r, imm):
    prog.append(op); prog.append(r); prog.extend(struct.pack("<I", imm & MASK))

# load 6 lanes from the 24-byte input
for j in range(6):
    emit(LOADW, j, j * 4)

# ARX rounds
for rnd in range(ROUNDS):
    for j in range(6):
        emit_imm(ADDI, j, RC[rnd][j])       # w[j] += RC
        emit(MOV, 6, (j + 1) % 6)           # t = w[next]
        emit(ROL, 6, 7)                     # t = rotl(t,7)
        emit(XOR, j, 6)                     # w[j] ^= t
        emit_imm(LOADI, 7, ODD)             # tmp = ODD
        emit(MUL, j, 7)                     # w[j] *= ODD
        emit_imm(ADDI, j, 1)               # w[j] += 1
        emit(ROL, j, 11)                   # w[j] = rotl(w[j],11)

# ---------------------------------------------------------------- reference interpreter
def run(program, inp, targets=None):
    reg = [0] * 8
    pc = 0
    ok = 1
    outs = []
    while pc < len(program):
        op = program[pc]; pc += 1
        if op == LOADW:
            r = program[pc]; idx = program[pc+1]; pc += 2
            reg[r] = struct.unpack_from("<I", inp, idx)[0]
        elif op == LOADI:
            r = program[pc]; pc += 1
            reg[r] = struct.unpack_from("<I", program, pc)[0]; pc += 4
        elif op == MOV:
            d = program[pc]; s = program[pc+1]; pc += 2; reg[d] = reg[s]
        elif op == ADD:
            d = program[pc]; s = program[pc+1]; pc += 2; reg[d] = (reg[d] + reg[s]) & MASK
        elif op == SUB:
            d = program[pc]; s = program[pc+1]; pc += 2; reg[d] = (reg[d] - reg[s]) & MASK
        elif op == XOR:
            d = program[pc]; s = program[pc+1]; pc += 2; reg[d] ^= reg[s]
        elif op == MUL:
            d = program[pc]; s = program[pc+1]; pc += 2; reg[d] = (reg[d] * reg[s]) & MASK
        elif op == ROL:
            d = program[pc]; n = program[pc+1]; pc += 2; reg[d] = rotl32(reg[d], n)
        elif op == ROR:
            d = program[pc]; n = program[pc+1]; pc += 2; reg[d] = rotr32(reg[d], n)
        elif op == ADDI:
            d = program[pc]; pc += 1
            imm = struct.unpack_from("<I", program, pc)[0]; pc += 4
            reg[d] = (reg[d] + imm) & MASK
        elif op == CMP:
            r = program[pc]; pc += 1
            imm = struct.unpack_from("<I", program, pc)[0]; pc += 4
            ok &= 1 if reg[r] == imm else 0
        elif op == HALT:
            break
        else:
            raise ValueError("bad op %d" % op)
    if targets is not None:
        return ok
    return reg[:6]

# compute targets from the intended serial, then append CMP + HALT
finals = run(bytes(prog), SERIAL)
TARGETS = finals[:]
for j in range(6):
    emit_imm(CMP, j, TARGETS[j])
emit(HALT)

# sanity: the finished program must accept the serial
assert run(bytes(prog), SERIAL, targets=True) == 1, "program does not accept serial"

# ---------------------------------------------------------------- rolling-key encryption
# runtime fetch: c = enc[pc] ^ (k & 0xff); k = k*A + C + c; pc++
A = 1103515245
C = 12345
SEED = 0x5A1CC0DE  # baked into the binary as the initial rolling key

def encrypt(plain, seed):
    k = seed & MASK
    out = bytearray()
    for p in plain:
        out.append(p ^ (k & 0xFF))
        k = (k * A + C + p) & MASK
    return bytes(out)

enc_prog = encrypt(bytes(prog), SEED)

# ---------------------------------------------------------------- flag KDF (from serial)
def fnv64(data, offset, prime):
    h = offset
    for b in data:
        h ^= b
        h = (h * prime) & 0xFFFFFFFFFFFFFFFF
    return h

def kdf128(serial):
    h0 = fnv64(serial, 0xCBF29CE484222325, 0x100000001B3)
    h1 = fnv64(serial[::-1], 0x84222325CBF29CE4, 0x100000001B3)
    return h0, h1

def xorshift128_stream(h0, h1, n):
    x = h0 & MASK
    y = (h0 >> 32) & MASK
    z = h1 & MASK
    w = (h1 >> 32) & MASK
    if (x | y | z | w) == 0:
        x = 0xDEADBEEF
    out = bytearray()
    while len(out) < n:
        t = x ^ ((x << 11) & MASK)
        x, y, z = y, z, w
        w = (w ^ (w >> 19) ^ t ^ (t >> 8)) & MASK
        out.extend(struct.pack("<I", w))
    return bytes(out[:n])

h0, h1 = kdf128(SERIAL)
ks = xorshift128_stream(h0, h1, len(FLAG))
flag_ct = bytes(f ^ k for f, k in zip(FLAG, ks))

# self-check: decrypt back
assert bytes(c ^ k for c, k in zip(flag_ct, ks)) == FLAG

# ---------------------------------------------------------------- emit header
def carr(name, data):
    lines = []
    for i in range(0, len(data), 12):
        chunk = ", ".join("0x%02x" % b for b in data[i:i+12])
        lines.append("    " + chunk + ",")
    return "static const unsigned char %s[] = {\n%s\n};\n#define %s_LEN (sizeof(%s))\n" % (
        name, "\n".join(lines), name.upper(), name)

with open("ziggurat_data.h", "w") as f:
    f.write("/* auto-generated by gen.py -- do not edit by hand */\n")
    f.write("#ifndef ZIGGURAT_DATA_H\n#define ZIGGURAT_DATA_H\n\n")
    f.write("#define VM_SEED 0x%08xu\n" % SEED)
    f.write("#define KDF_A   0x%08xu\n\n" % A if False else "")
    f.write(carr("enc_prog", enc_prog))
    f.write("\n")
    f.write(carr("flag_ct", flag_ct))
    f.write("\n#endif\n")

print("serial   :", SERIAL.decode())
print("flag     :", FLAG.decode())
print("prog len :", len(prog), "bytes")
print("targets  :", ["0x%08x" % t for t in TARGETS])
print("wrote ziggurat_data.h")
