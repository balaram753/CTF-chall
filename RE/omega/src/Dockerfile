FROM rust:1.82-bookworm AS build
WORKDIR /build
COPY Cargo.toml .
COPY src ./src
RUN cargo build --release --bin omega-oracle

FROM debian:bookworm-slim
RUN useradd --system --no-create-home --shell /usr/sbin/nologin omega
COPY --from=build /build/target/release/omega-oracle /app/omega-oracle
USER omega
WORKDIR /app
EXPOSE 7000
ENV OMEGA_BIND=0.0.0.0:7000
CMD ["/app/omega-oracle"]
