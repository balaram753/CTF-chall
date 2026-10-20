# Obelisk

`#rev` `#anti-debug` `#ptrace` `#custom-vm` `#symbolic-execution` `#z3` `#insane`

## 1. Challenge Info

- **Category:** REV
- **Difficulty:** Insane
- **Author:** Club CTF Team
- **Points:** 500 (decaying, min 150)
- **Files:** `obelisk` (stripped binary)

A sealed relic sits in the archive, waiting for the correct rite. Everyone who's tried gdb on it has come back saying it just... knows.

## 2. Reconnaissance

```text
$ file obelisk
obelisk: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV),
dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, stripped

$ ./obelisk
OBELISK
A sealed relic. It only responds to the correct rite.
> AAAA
The relic stays silent.
```

Asks for a 20-character "rite" and rejects everything. First thing worth trying: run it under a debugger.

```text
$ gdb -q -batch -ex run --args ./obelisk
tamper detected.
[Inferior 1 (process 1234) exited with code 01]
```

Attaching gdb kills it immediately, before we get anywhere near the interesting logic.

## 3. Reverse Engineering

### Phase 1 — the anti-debug check

`main()` opens with:

```c
static int being_traced(void) {
    return ptrace(PTRACE_TRACEME, 0, 1, 0) < 0;
}
```

Classic self-ptrace trick: a process can only be traced by one tracer at a time. If gdb has already attached, `PTRACE_TRACEME` fails and `being_traced()` returns true. Bypassed by patching/NOPing the call, `LD_PRELOAD`-ing a fake `ptrace` that always returns 0, or — simplest — just not attaching a live debugger at all. Everything past this point is fully solvable with static analysis alone.

### Phase 2 — it's not native code you need to reverse

Past the anti-debug and a length/charset check (20 bytes, printable ASCII), `main` hands the input to a function that decompiles into something almost content-free: a `while` loop pulling a byte from a ~390-byte constant array, `switch`-ing on it, and doing generic register arithmetic. That array — `vm_prog[]` — *is* the actual check. It's bytecode for a small custom VM built into the binary; the native disassembly of the interpreter tells you nothing about what's being validated.

Reversing the opcode set out of the interpreter's `switch`:

- `1` — `LOADI reg, imm32`
- `2` — `LOADB reg, idx8` (load `input[idx]`, zero-extended)
- `3` — `ADD dst, src`
- `4` — `XOR dst, src`
- `5` — `ROL dst, imm8`
- `6` — `MUL dst, src`
- `7` — `CMP reg, imm32` (sets a success flag)
- `8` — `HALT`

The program itself: seed an accumulator, then for each of the 20 input bytes (visited in a shuffled, non-sequential order) do `acc += input[byte]; acc ^= const_i; acc = rol(acc, n_i)`, folding in a `MUL` every 5th step. At the very end, `CMP` checks the accumulator against a single 32-bit constant baked into the last instruction, right before `HALT`.

### Phase 3 — the flag doesn't actually depend on passing the check

This is the real twist. The flag ciphertext (`flag_ct[]`, also just sitting in `.rodata`) is decrypted with an xorshift32 keystream seeded by that *same* 32-bit constant — `reveal_flag()` is called with `VM_TARGET` directly, not with anything derived from the input:

```c
#define VM_TARGET 0xb08ad79fu   /* the CMP immediate from vm_prog[] */

static void reveal_flag(uint32_t seed) {
    unsigned char keystream[FLAG_CT_LEN];
    xorshift32_stream(seed, keystream, FLAG_CT_LEN);
    for (size_t i = 0; i < FLAG_CT_LEN; i++)
        flag[i] = flag_ct[i] ^ keystream[i];
    ...
}
```

Find that one constant — plainly visible once the bytecode format is decoded, as the 4-byte immediate in the VM's final `CMP` — and the flag can be decrypted entirely offline, without ever finding an input that satisfies the hash.

## 4. Exploitation

### Phase 1 — static extraction (no serial required)

```python
def xorshift32_stream(seed, n):
    x = seed & 0xffffffff
    out = bytearray()
    while len(out) < n:
        x ^= (x << 13) & 0xffffffff
        x ^= (x >> 17)
        x ^= (x << 5) & 0xffffffff
        x &= 0xffffffff
        out += x.to_bytes(4, "little")
    return bytes(out[:n])

VM_TARGET = 0xb08ad79f
keystream = xorshift32_stream(VM_TARGET, len(flag_ct))
flag = bytes(a ^ b for a, b in zip(flag_ct, keystream))
```

This alone recovers the flag — the "insane" work is entirely in decoding the VM's bytecode format to find `VM_TARGET` and `flag_ct[]` in the first place.

### Phase 2 (optional) — solve it dynamically with z3

To see the binary print the flag itself, model the whole bytecode program symbolically: 20 input bytes as free `BitVec(8)` variables constrained to printable ASCII, replay every `ADD`/`XOR`/`ROL`/`MUL` exactly as the interpreter does, assert the final `CMP` equality, and ask for a satisfying model.

```python
import z3

inp = [z3.BitVec(f"b{i}", 8) for i in range(20)]
for b in inp:
    s.add(b >= 0x21, b <= 0x7e)
s.add(symbolic_run(inp))   # replays vm_prog's ADD/XOR/ROL/MUL/CMP over inp

s.check()                  # sat
serial = bytes(s.model()[b].as_long() for b in inp)
```

Solves in well under a second — brute-forcing 20 bytes directly (94^20 possibilities) is obviously not an option, but every opcode used is a plain bitvector operation z3 handles natively.

```text
$ echo 'SGX0j2;W*6lJyg2/L!&P' | ./obelisk       # (any z3-found solution works)
OBELISK
A sealed relic. It only responds to the correct rite.
> The seal breaks.

DNCTF{v1rtual_m4chines_hide_n0thing_forever}
```

Both routes land on the same flag, since the decrypt key is the fixed target constant, not the serial itself.

## 5. Flag

```text
DNCTF{v1rtual_m4chines_hide_n0thing_forever}
```

## 6. Why this matters

Custom VM obfuscation is a real technique used in commercial software protectors (VMProtect, Themida) and in malware, precisely because it defeats the standard "disassemble and read" workflow — the native code that actually executes is a generic, boring interpreter, and the logic that matters is data. The countermeasure is also standard practice in professional reverse engineering: once manual algebra on a hash-like mixing function stops being tractable, reach for symbolic execution (z3, angr) and let a solver handle the constraint satisfaction instead of trying to invert it by hand. Layering a self-ptrace check on top is a cheap way to punish naive dynamic analysis without doing anything to slow down someone working statically — which is exactly the gap this challenge is built to teach.
