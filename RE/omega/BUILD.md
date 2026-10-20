# Build and package

The challenge is authored for Linux x86-64 and requires Rust 1.82 or newer.

```bash
cargo test --release
cargo build --release --bin omega --bin omega-oracle
mkdir -p handout
cp target/release/omega handout/omega
strip --strip-all handout/omega
file handout/omega
```

The oracle container builds only `omega-oracle`; it never copies `solution/`.
Set `OMEGA_SERIAL` to the organizer serial, `OMEGA_MASTER_SEED` to a deployment
secret, and `OMEGA_FLAG` to the event flag at runtime. Do not put those values
in the image or player archive.

This Windows workspace does not have Rust, Docker, or an accessible WSL distro,
so the Linux ELF handout must be produced by the Linux build above or by the
provided container build in `src/` before publishing.
