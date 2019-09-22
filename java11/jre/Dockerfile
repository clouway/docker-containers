FROM adoptopenjdk/openjdk11:x86_64-alpine-jre11u-nightly

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN apk update
RUN apk add tzdata git
RUN cp /usr/share/zoneinfo/Europe/Sofia /etc/localtime

RUN echo "Europe/Sofia" > /etc/timezone
RUN rm /etc/localtime