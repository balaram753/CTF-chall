# Progressive hints (organizer-only)

1. The client is a protocol state machine: session, capsule, candidate, trace, solve. Record the capsule fields before touching the validator.
2. The capsule is 64 bytes encoded as 128 hex characters. The first 16 bytes seed all later runtime derivation.
3. Break on the loop that consumes virtual opcodes. Compare two runs with one candidate byte changed; this separates tape generation from input state.
4. Recover the inverse opcode permutation from the nonce and undo the per-byte tape mask. The canonical operations are small and total.
5. Solve the four lanes forward or invert the odd multipliers backward. The trace target is a second independent constraint, not decoration.
6. Validate your interpreter against the four lane targets and trace before sending anything to the service.
