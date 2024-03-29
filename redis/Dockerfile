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
RUN install_packages acl ca-certificates curl gzip libc6 libssl1.1 procps tar wget
RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack "wait-for-port" "1.0.0-3" --checksum 7521d9a4f9e4e182bf32977e234026caa7b03759799868335bccb1edd8f8fd12
RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack "redis" "6.2.5-1" --checksum c104089841a906f944e285828a580968608017340b67befaa1771646cbfdf6b3
RUN . /opt/bitnami/scripts/libcomponent.sh && component_unpack "gosu" "1.14.0-0" --checksum 4d858ac600c38af8de454c27b7f65c0074ec3069880cb16d259a6e40a46bbc50
RUN chmod g+rwX /opt/bitnami
RUN ln -s /opt/bitnami/scripts/redis/entrypoint.sh /entrypoint.sh
RUN ln -s /opt/bitnami/scripts/redis/run.sh /run.sh

COPY rootfs /
RUN /opt/bitnami/scripts/redis/postunpack.sh
ENV BITNAMI_APP_NAME="redis" \
    BITNAMI_IMAGE_VERSION="6.2.5-debian-10-r64" \
    PATH="/opt/bitnami/common/bin:/opt/bitnami/redis/bin:$PATH"

### My customization
RUN mkdir /opt/bitnami/redis/modules
COPY --from=searchimg /usr/lib/redis/modules/redisearch.so* /opt/bitnami/redis/modules
COPY --from=bloomimg /usr/lib/redis/modules/redisbloom.so* /opt/bitnami/redis/modules
### End of

EXPOSE 6379

USER 1001
ENTRYPOINT [ "/opt/bitnami/scripts/redis/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/redis/run.sh" ]
