#!/usr/bin/env python3
from pwn import *
HOST = args.HOST or "127.0.0.1"
PORT = int(args.PORT or 5001)
p = remote(HOST, PORT)
p.sendlineafter(b"Username: ", b"player")
p.sendlineafter(b"Access code: ", b"0")
p.interactive()
