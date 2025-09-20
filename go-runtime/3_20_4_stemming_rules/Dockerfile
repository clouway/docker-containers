# Stage 1: Downloader – fetch stemming rules file
FROM alpine:3.20.4 AS downloader
RUN apk update && apk add --no-cache curl ca-certificates tzdata apache2-utils && update-ca-certificates
RUN mkdir -p /opt/stemming_rules

# Replace the URL with the actual location of your stemming rules
RUN curl -fsSL https://raw.githubusercontent.com/clouway/stemming-rules/refs/heads/main/stem-rules-bg.txt -o /opt/stemming_rules/stem-rules-bg.txt
RUN curl -fsSL https://raw.githubusercontent.com/clouway/stemming-rules/refs/heads/main/stopwords-bg.txt -o /opt/stemming_rules/stopwords-bg.txt
RUN curl -fsSL https://raw.githubusercontent.com/clouway/stemming-rules/refs/heads/main/stopwords-en.txt -o /opt/stemming_rules/stopwords-en.txt

FROM alpine:3.20.4
MAINTAINER clouWay Devs <devs@clouway.com>

RUN apk update && apk add --no-cache ca-certificates tzdata apache2-utils && update-ca-certificates

COPY --from=downloader /opt/stemming_rules /opt/stemming_rules
