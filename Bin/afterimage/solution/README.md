# Afterimage organizer notes

The launcher creates a fresh flag for each container and exports it as
`AFTERIMAGE_FLAG`; the binary has no copy of the flag.

`clone` copies the `Capability *` instead of retaining ownership. `revoke`
deletes the checked-out capability but clears only the current snapshot. The
clone still contains the freed pointer. A following `new` allocates an
`Image` of the same size, which reuses the freed capability chunk.

The stale clone's `patch` operation writes four bytes through that pointer.
The capability privilege is at offset 8; after type confusion, that offset is
the image label. Writing `0x7a11ce55` makes `restore branch` pass.
