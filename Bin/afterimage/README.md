# Afterimage

Category: PWN / Binary Exploitation
Difficulty: God

Afterimage is an administration service for a snapshot store. The service
supports branching and rollback, but its ownership bookkeeping is less careful
than its UI suggests.

The service launcher creates a fresh random flag when an instance starts; it is
not stored in the binary or filesystem. The intended path is a stale
capability reference, allocator type confusion, and a bounded field write.
