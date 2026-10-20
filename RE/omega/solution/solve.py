"""Organizer-only deterministic regression solver; never ship this file."""
from pathlib import Path

SERIAL = b"trace_the_ashen_thread_9f2a7c1de"
assert len(SERIAL) == 32

def expected_flag() -> str:
    return Path(__file__).with_name("flag.txt").read_text().strip()

if __name__ == "__main__":
    print("serial length:", len(SERIAL))
    print("flag loaded from organizer file:", bool(expected_flag()))
