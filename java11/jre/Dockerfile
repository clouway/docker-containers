FROM adoptopenjdk/openjdk11:x86_64-alpine-jre11u-nightly

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN apk update
RUN apk add tzdata git
RUN cp /usr/share/zoneinfo/Europe/Sofia /etc/localtime
RUN echo "Europe/Sofia" > /etc/timezone
RUN rm /etc/localtime

# libc.musl is required by the graphic libraries and they are messed
# up in alpine. This commands are workaround of the issue described
# at: https://github.com/AdoptOpenJDK/openjdk-docker/issues/75
RUN apk add --no-cache fontconfig ttf-dejavu terminus-font && fc-cache -f
RUN ln -s /lib/libc.musl-x86_64.so.1 /usr/lib/libc.musl-x86_64.so.1
ENV LD_LIBRARY_PATH /usr/lib

# Add Bazel rules compatibility as bazel looks only in /usr/bin/java.
RUN ln -s /opt/java/openjdk/bin/java /usr/bin/java
