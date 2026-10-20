# Deadbolt — command reference (for the end-of-event walkthrough)

These are the commands used to analyse and attack the lock. The last stage is
automated by a small exploit tool (kept by the instructor). Everything up to it,
students can run themselves.

## 1. Carve the firmware out of the flash dump

```sh
binwalk deadbolt-flash.bin
```
Shows a SquashFS filesystem at offset `0x1000`.

```sh
binwalk -e deadbolt-flash.bin
cd _deadbolt-flash.bin.extracted/squashfs-root
find . -type f
```
Extracts and lists the device's root filesystem.

## 2. Read the device files

```sh
cat etc/deadbolt.conf
cat etc/banner
cat etc/init.d/rcS
```
`rcS` shows `/usr/bin/lockd` starts at boot. `deadbolt.conf` says the signing key is
"fused in silicon, not stored here" — so there is no key to find on the flash.

## 3. Inspect the controller binary

```sh
file usr/bin/lockd
strings usr/bin/lockd | grep -iE 'sig=|role=|salt=|vault|urandom|DEVICE_KEY'
```
The strings reveal the whole protocol and the bug:
```text
salt=%s&uid=1000&role=guest      <- the token the lock signs for you
%s&sig=%s                         <- message, then its signature
&sig=                             <- how a signed command is framed
ok=1&vault=%s                     <- the reply that contains the flag
```
The signature is `SHA256(secret + message)` — a secret-prefixed hash. That is the
vulnerable construction.

## 4. Confirm the wire is not plain text

```sh
nc HOST PORT
```
You get binary garbage, not readable text. The protocol is framed (`0xDB 0x01`, a
length, then the payload) and the payload is XOR-masked with a small keystream. This
is why you cannot just type commands with `nc` — it has to be scripted.

## 5. The attack — hash length extension

The lock signs a guest token with `SHA256(secret + msg)` and then trusts any message
whose signature checks out, with "last field wins" parsing. That lets you take the
signed guest token and append `&role=admin&cmd=dump` while forging a valid signature,
**without knowing the secret**. The classic tool that does the hash math is HashPump:

```sh
# one-time install (either one)
pip install hashpumpy           # Python module 'hashpumpy'
# or build https://github.com/bwall/HashPump for the `hashpump` command
```

```sh
# demonstrates the forgery: given the token and its signature, append the admin fields
hashpump -s <sig_hex> -d 'salt=<nonce>&uid=1000&role=guest' -k <secret_len> -a '&role=admin&cmd=dump'
```
It prints a new signature and the new message (with the padding "glue" bytes). The
secret length is unknown, so you try each length until the device accepts it.

The exploit tool automates three things HashPump does not: undoing the wire mask,
wrapping the forged message back into a frame, and looping the length brute over a
live connection. Run it against the challenge to get the flag:

```sh
./exploit HOST PORT
```
```text
[+] secret length = 21
[+] flag: DNCTF{...}
```

## Commands used, at a glance

```text
binwalk / binwalk -e     carve the firmware
find / cat / file        explore the filesystem and config
strings | grep           read the protocol and spot SHA256(secret+msg)
nc                        show the protocol is framed/masked, not text
hashpump                 forge the signature via hash length extension
```
