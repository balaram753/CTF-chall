# Organizer Solution — Echoes

The intended vulnerability is a stack-based buffer overflow caused by `gets()`.

The binary is deliberately compiled with stack canaries disabled and PIE disabled while NX remains enabled.

For the intended build, `buffer` begins at `rbp-0x30` and `access` is at `rbp-0x4`, giving an offset of:

    0x30 - 0x04 = 0x2c = 44 bytes

The target value is `0x1337`. On x86-64 it is written little-endian as:

    37 13 00 00

Intended payload:

    b"A" * 44 + p32(0x1337)

The overwrite changes `access` to `0x1337`, which calls the existing `win()` function. No shell is required.
