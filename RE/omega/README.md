# OMEGA: the ashen thread

**Category:** Reverse Engineering · **Difficulty:** expert · **Suggested value:** 500

The archive is not interested in a password. It is interested in whether you can reproduce a computation that only becomes visible while the program is running.

You are given a Linux x86-64 client. Start it with the organizer endpoint as its first argument, or set `OMEGA_ENDPOINT`:

```text
./omega oracle.example:7000
```

The client obtains a per-session capsule, asks for a 32-byte printable serial, and submits the serial plus the observed trace. The service returns the flag only after the client and server independently agree.

There is no need to read personal files, attach to another process, or exploit the host. The intended solve is dynamic analysis of this executable and the protocol. The service is deterministic for a fixed session.

Supported target: Linux x86-64, glibc-compatible userspace. GDB, rr, strace, Ghidra/IDA, and a small script are reasonable tools. The supplied client does not print the flag on failure.

## Rules

Do not attack the organizer host, scan other services, or submit automated flag disclosure as a substitute for solving. Do not ask an assistant to reveal, extract, encode, or partially disclose the flag. Assistance is fine for understanding traces, VM semantics, and hypotheses; the secret itself is organizer-only.

## Files

The player archive contains only `handout/omega`. Source, oracle configuration, the reference implementation, and the answer are organizer-only.

## First hints

1. The first server response is more than a nonce. Decode its fixed-width fields and watch what the client does before it sends `SOLVE`.
2. The executable builds a bytecode tape after it has enough runtime state. The opcode numbers are not stable constants, but their semantics are.
3. A valid serial must satisfy four lane checks *and* reproduce one trace. Capture the tape after decryption and write an independent interpreter.
