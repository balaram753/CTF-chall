#!/bin/sh
set -eu

suffix="$(od -An -N16 -tx1 /dev/urandom | tr -d ' \n')"
export AFTERIMAGE_FLAG="DNCTF{afterimage_${suffix}}"
exec socat TCP-LISTEN:6000,reuseaddr,fork EXEC:/app/session.sh,stderr
