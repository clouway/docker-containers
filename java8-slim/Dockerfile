FROM openjdk:8-jdk-stretch

MAINTAINER Telcong Dev <telcong@clouway.com>

RUN apt-get update
RUN cp /usr/share/zoneinfo/Europe/Sofia /etc/localtime

RUN echo "Europe/Sofia" > /etc/timezone
RUN rm /etc/localtime

RUN apt-get install -y rsync

# EOF
