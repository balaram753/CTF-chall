FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends socat \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --create-home --uid 10001 ctf

WORKDIR /app

COPY echoes /app/echoes
COPY flag.txt /app/flag.txt

RUN chmod 0555 /app/echoes \
    && chmod 0444 /app/flag.txt \
    && chown root:root /app/echoes /app/flag.txt

USER 10001

EXPOSE 5000

CMD ["socat", "TCP-LISTEN:5000,reuseaddr,fork", "EXEC:/app/echoes,stderr"]
