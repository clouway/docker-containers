FROM adoptopenjdk/openjdk11:x86_64-alpine-jdk-11.0.4_11-slim 

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN apk update
RUN apk add tzdata git rsync
RUN cp /usr/share/zoneinfo/Europe/Sofia /etc/localtime

RUN echo "Europe/Sofia" > /etc/timezone
RUN rm /etc/localtime
