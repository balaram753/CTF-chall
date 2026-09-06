#!/usr/bin/env python3
"""
Solve for Keystone (RE, easy).

The binary XORs every byte of your input with 0x5a and compares it
against a hardcoded array before it will decode and print the flag.
Recover the key/array from check_serial() (Ghidra/objdump), then just
XOR the encoded bytes back to get the activation code and feed it in.
"""

KEY = 0x5a

enc_serial = [
    0x14, 0x69, 0x6a, 0x14, 0x77, 0x1e, 0x6e, 0x0d, 0x14, 0x77, 0x62, 0x62,
]

serial = bytes(b ^ KEY for b in enc_serial).decode()
print("[*] Recovered activation code:", serial)

# Feed it to the binary, e.g.:
#   echo <serial> | ./keystone
import subprocess
p = subprocess.run(["./handout/keystone"], input=serial + "\n",
                    capture_output=True, text=True, cwd="..")
print(p.stdout)
