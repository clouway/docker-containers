FROM ghcr.io/cloudnative-pg/postgresql:17-bookworm

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
         curl \
         gnupg \
         lsb-release \
    && curl -fsSL https://packagecloud.io/timescale/timescaledb/gpgkey \
         | gpg --dearmor -o /usr/share/keyrings/timescaledb.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/timescaledb.gpg] \
         https://packagecloud.io/timescale/timescaledb/debian/ bookworm main" \
         > /etc/apt/sources.list.d/timescaledb.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
         timescaledb-2-postgresql-17 \
    && apt-get purge -y curl gnupg lsb-release \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

USER 26
