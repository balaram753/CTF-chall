FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends socat \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY afterimage /app/afterimage
COPY entrypoint.sh /app/entrypoint.sh
COPY session.sh /app/session.sh
RUN useradd --create-home --uid 10002 ctf \
    && chmod 0555 /app/afterimage \
    && chmod 0555 /app/entrypoint.sh \
    && chmod 0555 /app/session.sh \
    && chown root:root /app/afterimage /app/entrypoint.sh /app/session.sh
USER 10002
EXPOSE 6000
CMD ["/app/entrypoint.sh"]
