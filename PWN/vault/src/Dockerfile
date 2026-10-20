FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends socat && rm -rf /var/lib/apt/lists/*
RUN useradd --create-home --uid 10002 ctf
WORKDIR /app
COPY vault /app/vault
COPY flag.txt /app/flag.txt
COPY session.sh /app/session.sh
RUN chmod 0555 /app/vault /app/session.sh && chmod 0444 /app/flag.txt && chown root:root /app/vault /app/session.sh /app/flag.txt
USER 10002
EXPOSE 6000
CMD ["socat", "TCP-LISTEN:6000,reuseaddr,fork", "EXEC:/app/session.sh,stderr"]
