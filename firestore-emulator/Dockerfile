# Version. Can change in build progress
ARG GCLOUD_SDK_VERSION=313.0.1-alpine

# Use google cloud sdk
FROM google/cloud-sdk:$GCLOUD_SDK_VERSION
MAINTAINER devs@clouway.com

# Install Java 8 for Datastore emulator
RUN apk add --update --no-cache openjdk8-jre &&\
    gcloud components install cloud-firestore-emulator beta --quiet

# Volume to persist Datastore data
VOLUME /opt/data

COPY start-firestore .

EXPOSE 8080

ENTRYPOINT ["./start-firestore"]
