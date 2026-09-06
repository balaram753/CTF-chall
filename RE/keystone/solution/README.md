# Keystone

`#rev` `#crackme` `#xor-obfuscation` `#static-analysis`

## 1. Challenge Info

- **Category:** REV
- **Difficulty:** Easy
- **Author:** Club CTF Team
- **Points:** 100 (decaying, min 25)
- **Files:** `keystone` (stripped binary)

Somebody's selling "cracked" builds of a tool that still checks for a license. We got our hands on the binary. Find out what it's hiding.

## 2. Reconnaissance

```text
$ file keystone
keystone: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV),
dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, stripped

$ strings keystone | grep -i ctf
(nothing)
```

Stripped, no symbols, and `strings` turns up nothing useful — no plaintext serial, no flag. That's the tell: whatever the binary compares your input against isn't stored in the clear. Time to look at the disassembly instead of the string table.

## 3. Reverse Engineering

Two functions matter, both easy to pick out in Ghidra even without symbol names:

```c
static int check_serial(const char *input) {
    if (strlen(input) != SERIAL_LEN) return 0;         // 12 bytes
    for (size_t i = 0; i < SERIAL_LEN; i++) {
        if ((input[i] ^ 0x5a) != enc_serial[i]) return 0;
    }
    return 1;
}

static void reveal_flag(void) {
    char flag[FLAG_LEN + 1];
    for (size_t i = 0; i < FLAG_LEN; i++) {
        flag[i] = enc_flag[i] ^ 0x5a;                   // same key
    }
    flag[FLAG_LEN] = '\0';
    printf("%s\n", flag);
}
```

Both the expected serial and the flag itself are stored as `plaintext ^ 0x5a` — a single repeating-byte key. The comparison loop and the decode loop use the exact same XOR constant, visible directly in the disassembly as an immediate operand (`xor $0x5a, %eax` appears in both routines).

## 4. Exploitation

### Phase 1 — pull the encoded serial out of `.rodata`

```text
enc_serial[] = 14 69 6a 14 77 1e 6e 0d 14 77 62 62
```

### Phase 2 — undo the XOR in Python

```python
KEY = 0x5a
enc_serial = [0x14, 0x69, 0x6a, 0x14, 0x77, 0x1e, 0x6e, 0x0d, 0x14, 0x77, 0x62, 0x62]
serial = bytes(b ^ KEY for b in enc_serial).decode()
print(serial)   # N30N-D4WN-88
```

### Phase 3 — feed it back in

The binary decodes and prints the flag itself once the serial matches — no need to hand-decode `enc_flag[]` separately.

```text
$ echo 'N30N-D4WN-88' | ./keystone
=== KEYSTONE ACTIVATION ===
This build is unlicensed. Enter your activation code to continue.
> Activation accepted.

CTF{x0r_whispers_the_truth}
```

## 5. Flag

```text
CTF{x0r_whispers_the_truth}
```

## 6. Why this matters

XOR-with-a-static-key is the "hello world" of binary obfuscation — trivial to defeat once you spot it, but it does exactly what it's meant to: it defeats `strings`, the very first tool most people reach for. The lesson is less about the cipher (which is not encryption) and more about the workflow: when the obvious static tools come up empty, that's a signal to open a disassembler, not a dead end. Every byte array referenced by a comparison or a decode loop is a candidate for exactly this pattern.
