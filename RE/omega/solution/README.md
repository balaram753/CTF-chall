# OMEGA organizer notes

Keep this directory out of the player archive. The canonical answer is stored in `flag.txt`; do not paste it into public tickets, hints, logs, or automated assistant prompts.

## Intended solve

The client sends a 16-byte session identifier. The oracle derives a 16-byte nonce and creates a 64-byte capsule: nonce, four 64-bit lane targets, a trace target, and a seal. The client reconstructs the same VM locally.

At runtime, `runtime_program` creates a canonical tape from the nonce, shuffles the twelve opcode encodings, and XOR-masks every tape byte with a nonce-derived keystream. `Vm::byte` reverses the mask. The solver should break after tape construction or log reads from `Vm::byte`, then implement the instruction set below.

The four lanes are initialized from candidate chunks and transformed for 36 rounds with add, odd multiply, rotate, cross-lane XOR, and swaps. Push/pop-XOR is a reversible decoy. Trace instructions fold selected bits and tags into an avalanche accumulator. The final four checks compare lanes with the capsule; the server additionally checks the trace and exact serial.

The organizer reference is `solve.py`. It derives the expected serial from the same controlled value used to seed the oracle and verifies a full client/server exchange. `flag.txt` is the only authoritative answer.

## VM reference

`Load(d,c)` loads eight little-endian candidate bytes; `XorImm`, `AddImm`, and `MulImm` operate modulo 2^64; `XorRot(d,s,r)` XORs a rotated source; `Rotate` rotates a lane; `Swap` exchanges lanes; `Push` and `PopXor` use a 16-word stack; `Trace(s,b,t)` updates the accumulator from bit `b`; `Check(s,t)` sets check bit `t`; `Halt` returns. Opcode bytes are nonce-shuffled.

## Shortcut assessment

Static `strings` finds protocol text but not the answer. The answer is not in the ELF, capsule, environment, or debug metadata. Patching the final branch still leaves the server's exact-candidate comparison. A memory dump after the oracle has accepted a candidate can expose the configured flag to an organizer with process access; that is an expected limitation of a server-assisted CTF, not a player capability. No anti-debugging behavior is used.
