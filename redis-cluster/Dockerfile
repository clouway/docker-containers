#### My customization
FROM redislabs/redisearch:latest AS searchimg
FROM redislabs/rebloom AS bloomimg
#### End of
FROM docker.io/bitnami/minideb:buster
LABEL maintainer "Bitnami <containers@bitnami.com>"

ENV HOME="/" \
    OS_ARCH="amd64" \
    OS_FLAVOUR="debian-10" \
    OS_NAME="linux"

COPY prebuildfs /
# Install required system packages and dependencies
RUN install_packages acl ca-certificates curl gzip libc6 libssl1.1 procps tar
RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack "redis" "6.2.6-1" --checksum 172caf7ebf69ba8105ec7f05150a7e341fdf117c9650cbcb9191919a523ada86
RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack "gosu" "1.14.0-0" --checksum 3e6fc37ca073b10a73a804d39c2f0c028947a1a596382a4f8ebe43dfbaa3a25e
RUN chmod g+rwX /opt/bitnami

COPY rootfs /
RUN /opt/bitnami/scripts/redis-cluster/postunpack.sh
ENV BITNAMI_APP_NAME="redis-cluster" \
    BITNAMI_IMAGE_VERSION="6.2.6-debian-10-r24" \
    PATH="/opt/bitnami/redis/bin:/opt/bitnami/common/bin:$PATH"

### My customization
RUN mkdir /opt/bitnami/redis/modules
COPY --from=searchimg /usr/lib/redis/modules/redisearch.so* /opt/bitnami/redis/modules
COPY --from=bloomimg /usr/lib/redis/modules/redisbloom.so* /opt/bitnami/redis/modules
### End of

EXPOSE 6379

USER 1001
ENTRYPOINT [ "/opt/bitnami/scripts/redis-cluster/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/redis-cluster/run.sh" ]
