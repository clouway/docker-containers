# AlpineLinux with a glibc-2.23 and Oracle Java 8
FROM alpine:3.4

MAINTAINER Telcong Dev <telcong@clouway.com>

# Java Version and other ENV
ENV JAVA_VERSION_MAJOR=8 \
    JAVA_VERSION_MINOR=141 \
    JAVA_VERSION_BUILD=13 \
    JAVA_PACKAGE=jdk \
    JAVA_JCE=standard \
    JAVA_HOME=/opt/jdk \
    PATH=${PATH}:/opt/jdk/bin \
    GLIBC_VERSION=2.23-r3 \
    LANG=C.UTF-8

RUN apk --update add curl ca-certificates tar bash \
    && curl -Ls https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk > /tmp/glibc-2.23-r3.apk \
    && apk add --allow-untrusted /tmp/glibc-2.23-r3.apk

RUN apk add rsync openssh

ENV JAVA_DOWNLOAD=
RUN mkdir -p /opt && curl -jfksSLH "Cookie: oraclelicense=accept-securebackup-cookie" \
      "${JAVA_DOWNLOAD:-$(curl -s https://lv.binarybabel.org/catalog-api/java/jdk8.txt?p=downloads.tgz)}" \
      | tar -xzf - -C /opt \
    && ln -s /opt/jdk1.*.0_* /opt/jdk \
    && rm -rf /opt/jdk/*src.zip \
              /opt/jdk/lib/missioncontrol \
              /opt/jdk/lib/visualvm \
              /opt/jdk/lib/*javafx* \
              /opt/jdk/jre/lib/plugin.jar \
              /opt/jdk/jre/lib/ext/jfxrt.jar \
              /opt/jdk/jre/bin/javaws \
              /opt/jdk/jre/lib/javaws.jar \
              /opt/jdk/jre/lib/desktop \
              /opt/jdk/jre/plugin \
              /opt/jdk/jre/lib/deploy* \
              /opt/jdk/jre/lib/*javafx* \
              /opt/jdk/jre/lib/*jfx* \
              /opt/jdk/jre/lib/amd64/libdecora_sse.so \
              /opt/jdk/jre/lib/amd64/libprism_*.so \
              /opt/jdk/jre/lib/amd64/libfxplugins.so \
              /opt/jdk/jre/lib/amd64/libglass.so \
              /opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
              /opt/jdk/jre/lib/amd64/libjavafx*.so \
              /opt/jdk/jre/lib/amd64/libjfx*.so

ENV JAVA_HOME /opt/jdk
ENV PATH ${PATH}:${JAVA_HOME}/bin

RUN apk add tzdata
RUN cp /usr/share/zoneinfo/Europe/Sofia /etc/localtime

RUN echo "Europe/Sofia" > /etc/timezone
RUN rm /etc/localtime

# EOF
