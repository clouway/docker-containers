# Java 21 JRE (multi-arch)
FROM eclipse-temurin:21-jre-jammy

# Install Google Cloud CLI + Datastore emulator component
RUN set -eux; \
    apt-get update; \
    apt-get install -y curl gnupg ca-certificates; \
    install -d -m 0755 /etc/apt/keyrings; \
    curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg \
      | gpg --dearmor -o /etc/apt/keyrings/cloud.google.gpg; \
    echo "deb [signed-by=/etc/apt/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
      > /etc/apt/sources.list.d/google-cloud-sdk.list; \
    apt-get update; \
    apt-get install -y google-cloud-cli google-cloud-cli-datastore-emulator; \
    rm -rf /var/lib/apt/lists/*

ENV CLOUDSDK_CORE_DISABLE_PROMPTS=1
EXPOSE 8888
CMD ["gcloud","beta","emulators","datastore","start","--project=test","--host-port=0.0.0.0:8888","--consistency=1","--no-store-on-disk"]
