#!/bin/sh
# Randomize the signing key (and therefore its length) per container, so each
# live instance forces the solver to brute the secret length online. The key
# itself is never needed by the intended attack and never leaves the device.
LEN=$(( 12 + $(od -An -N1 -tu1 /dev/urandom) % 25 ))   # secret is 12..36 bytes
DEVICE_KEY=$(head -c 4096 /dev/urandom | tr -dc 'A-Za-z0-9' | head -c "$LEN")
export DEVICE_KEY
export PORT=6000
exec /usr/bin/lockd
