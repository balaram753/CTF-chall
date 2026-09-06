# Ziggurat — solution

**Flag:** `CTF{each_lay3r_c0nceals_the_next_one_below}`
**Serial:** `Zigg7St3pped//Rite//x!23`

This is the intended path. `solve.py` performs all of it from nothing but three
values lifted out of the binary by hand: `VM_SEED`, the encrypted bytecode array,
and the flag ciphertext.

### 1. Get past the guard

`main` calls `ptrace(PTRACE_TRACEME, ...)` and bails if it fails, so a debugger
that's already attached makes the process refuse. Nothing about the challenge
needs a live debugger — analyze it statically, or `LD_PRELOAD` a `ptrace` stub if
you insist on running it under one. It's a speed bump, not the puzzle.

### 2. Wake the program up

The interpreter is easy to read, but the array it runs (`enc_prog`) is ciphertext.
The fetch routine decrypts each byte as it reads it:

```
c = enc_prog[pc] ^ (key & 0xff)
key = key*1103515245 + 12345 + c
```

`key` starts at the constant `VM_SEED`. Because the VM never jumps backwards, the
order bytes are fetched is exactly their order in the array, so you can decrypt the
whole thing in one linear pass. A static disassembler that reads `enc_prog` directly
sees garbage — this is what stops the obelisk-style "just dump the bytecode" move.

### 3. Lift the VM and solve

The decrypted program is a small register machine:

- load six little-endian 32-bit lanes `w[0..5]` from the 24 input bytes,
- four rounds of, per lane: `+= RC`, `^= rotl(w[next], 7)`, `*= 0x9E3779B1`, `+= 1`, `rotl 11`,
- `CMP` each lane against a baked-in target.

The cross-lane xor and the multiply mean the bytes don't separate, so byte-by-byte
brute force is out. Rebuild the operations symbolically over 24 `BitVec(8)` inputs,
constrain each to printable range `0x21..0x7e`, add the six `CMP` equalities, and z3
returns the unique serial instantly. (It's also invertible by hand if you prefer —
every operation has an inverse — but the solver is the fast route.)

### 4. Decrypt the flag

There is no flag key stored in the binary. After the check passes, `reveal_flag`
derives the key from the serial you just typed: two FNV-1a-64 hashes of the 24 bytes
(one forward, one reversed) seed an xorshift128 keystream, which is xored over
`flag_ct`. So you genuinely have to recover the serial before the flag is reachable;
there's no 32-bit seed to brute and no constant to grab.

### Run it

```
python solve.py
```

Or just feed the recovered serial back to the binary:

```
echo 'Zigg7St3pped//Rite//x!23' | ./ziggurat
```

### Files

- `solve.py` — full automated solve (needs `z3-solver`: `pip install z3-solver`).
- `ziggurat.debug` — unstripped build for reference. **Organizer only — do not hand to players.**
