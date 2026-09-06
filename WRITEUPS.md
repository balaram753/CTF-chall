# CTF Writeups

writeups: 4 · categories: 2

Organizer-only. Full walkthroughs live alongside each challenge's solution files — none of this ships to players.

## PWN

- **[Echoes](PWN/echoes/solution/README.md)** — Easy · 100 pts · `#pwn` `#stack-overflow` `#no-canary` `#no-pie` `#gets`
  Unbounded `gets()` overwrites an adjacent access-control variable on the stack. No leak, no ROP.

- **[Vault](PWN/vault/solution/README.md)** — Medium · 200 pts · `#pwn` `#logic-bug` `#signed-integer-overflow`
  A bias-then-sign-check "range validation" on a signed 32-bit int accepts almost every ordinary input by accident.

## REV

- **[Keystone](RE/keystone/solution/README.md)** — Easy · 100 pts · `#rev` `#crackme` `#xor-obfuscation`
  Serial and flag both stored as `plaintext ^ 0x5a`; `strings` shows nothing, disassembly shows everything.

- **[Obelisk](RE/obelisk/solution/README.md)** — Insane · 500 pts · `#rev` `#anti-debug` `#custom-vm` `#z3` `#symbolic-execution`
  Self-ptrace anti-debug guarding a custom bytecode VM; flag decrypts from a constant baked into the VM's final comparison — no need to ever satisfy the check, though z3 solves it in under a second if you want the binary to print it live.

---

Each challenge folder keeps the same layout: `handout/` and the top-level `README.md` are player-facing; `src/`, `challenge.yml`, and `solution/` (writeup, `solve.py`, unstripped debug binary) are organizer-only.
