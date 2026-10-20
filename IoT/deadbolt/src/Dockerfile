FROM debian:bookworm-slim AS build
RUN apt-get update && apt-get install -y --no-install-recommends gcc libc6-dev && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY lockd.c .
RUN gcc -O2 -s -o lockd lockd.c

FROM debian:bookworm-slim
RUN useradd -m -u 10001 lock
COPY --from=build /build/lockd /usr/bin/lockd
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
USER lock
EXPOSE 6000
# FLAG is injected per team at spawn. DEVICE_KEY is randomized per container so
# the secret length must be brute-forced online against each instance.
ENV FLAG="DNCTF{replace_me_per_team}"
CMD ["/usr/bin/entrypoint.sh"]
