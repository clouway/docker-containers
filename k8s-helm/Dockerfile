# AlpineLinux with Helm
FROM alpine:3.7

LABEL maintainer="clouWay Devs <devs@clouway.com>"

ENV HELM_LATEST_VERSION="v2.14.2"

RUN apk update && apk upgrade \
 && apk add --no-cache ca-certificates bash git curl openssh \
 && curl -L https://storage.googleapis.com/kubernetes-helm/helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz -o helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && tar -xvf helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && rm /var/cache/apk/* \
 && rm -f /helm-${HELM_LATEST_VERSION}-linux-amd64.tar.gz

RUN git version
RUN helm init --client-only
RUN helm plugin install https://github.com/futuresimple/helm-secrets

ENTRYPOINT ["helm"]
CMD ["help"]