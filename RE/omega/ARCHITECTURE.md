# OMEGA technical report

OMEGA has three deliberately separate phases.

1. The protocol phase derives a session nonce and exchanges a fixed-size capsule.
2. The runtime phase derives a shuffled, masked VM tape from that nonce.
3. The validation phase executes 36 rounds, folds a trace, checks four lanes, and returns a verdict.

The visible client is useful as an observation point: the server supplies the
capsule, but all candidate-dependent computation happens locally before the
`SOLVE` line. A solver can therefore work offline after one capture.

The state machine is deterministic: `HELLO -> CAPSULE -> candidate -> SOLVE ->
FLAG/NO`. Inside the VM, the meaningful states are initialization, round
transformation, trace accumulation, lane checks, and halt. The push/pop pair is
a no-op-shaped decoy whose purpose is to make a raw trace less self-explanatory;
it is still fully specified and safe.

The only organizer secret is the configured serial/flag pair. The capsule does
not contain the serial; it contains four output targets and a trace target. The
seal prevents changing those targets without understanding the same nonce-based
mixing function. Since all arithmetic is wrapping `u64`, the reference behavior
is independent of debugger quirks and host endianness is made explicit at every
byte boundary.

Known limitations: an analyst with arbitrary access to the oracle host can read
its environment or process memory. The challenge does not claim to prevent that
and uses no destructive anti-debugging, persistence, credential collection, or
outbound communication.
