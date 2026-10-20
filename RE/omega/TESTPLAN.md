# OMEGA test plan

## Build and service

1. On Linux, run `cargo test --release` and `cargo build --release --bins`.
2. Run the oracle with a deployment-only seed, serial, and flag; connect with the client from a separate network namespace.
3. Repeat ten sessions and verify each capsule is stable when `OMEGA_SESSION` is fixed and different when the session changes.
4. Verify malformed `HELLO`, bad hex, wrong lengths, extra fields, and invalid trace receive `ERR` or `NO` without a panic.

## Intended solve

The unit tests cover acceptance, rejection, capsule round trips, deterministic generation, and seal mutation. The organizer run must additionally submit the reference serial and observe `FLAG`; one-byte mutations must receive `NO`.

## Unintended paths

- `strings`, symbol listing, and section inspection: no flag or serial.
- Decompiler and basic symbolic execution: useful for semantics, insufficient without reconstructing nonce-dependent tape data.
- Final-branch patching: server checks the capsule, trace, and exact candidate.
- Brute force: 32 printable bytes and nonlinear 64-bit lane mixing.
- Repeated execution: deterministic for fixed session; no timing oracle.
- Memory dump: accepted only as an organizer-side limitation; the player never receives the oracle process or its environment.

## Deployment checks

Build the container, confirm it runs non-root with a read-only filesystem and no added capabilities, then verify only TCP/7000 is reachable. Keep the three deployment secrets outside the image and rotate them before the event.
