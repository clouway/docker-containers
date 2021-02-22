FROM azul/zulu-openjdk-alpine:11.0.10-11.45.27

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN apk update
RUN apk add tzdata git
RUN cp /usr/share/zoneinfo/Europe/Sofia /etc/localtime
RUN echo "Europe/Sofia" > /etc/timezone
RUN rm /etc/localtime

# Add Bazel rules compatibility as they look only in /usr/bin/java.
#RUN ln -s /opt/java/openjdk/bin/java /usr/bin/java
