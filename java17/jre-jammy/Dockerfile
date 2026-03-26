# (a) Prefer a stable JRE image (Temurin) over nightly builds
#    If you must stay on 11 + Alpine, see "If you must stay on Alpine" below.
FROM eclipse-temurin:17-jre-jammy

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# Timezone (optional)
RUN apt-get update && apt-get install -y --no-install-recommends tzdata && \
    ln -sf /usr/share/zoneinfo/Europe/Sofia /etc/localtime && \
    echo "Europe/Sofia" > /etc/timezone && \
    rm -rf /var/lib/apt/lists/*

# If you really need fonts for rendering (pdf/graphics):
RUN apt-get update && apt-get install -y --no-install-recommends fontconfig fonts-dejavu && \
    fc-cache -f && rm -rf /var/lib/apt/lists/*

# Hard JVM caps (tweak numbers if your pod limit differs)
# - keep total native overhead tame (metaspace, direct, code cache, threads)
# - start small, grow as needed, avoid reserving the whole limit at idle
ENV JAVA_TOOL_OPTIONS="\
 -XX:+UseG1GC \
 -XX:+UseStringDeduplication \
 -XX:MaxRAMPercentage=40 \
 -XX:InitialRAMPercentage=10 \
 -XX:MaxMetaspaceSize=128m \
 -XX:MaxDirectMemorySize=64m \
 -XX:ReservedCodeCacheSize=128m \
 -Xss256k \
 -XX:ActiveProcessorCount=2 \
 -Djava.awt.headless=true \
 -Dfile.encoding=UTF-8 \
 -XX:+ExitOnOutOfMemoryError"
