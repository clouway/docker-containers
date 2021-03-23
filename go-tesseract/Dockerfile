FROM alpine:3.13.2
MAINTAINER clouWay Devs <devs@clouway.com>

RUN apk update && apk add --no-cache ca-certificates tzdata apache2-utils && update-ca-certificates
RUN apk add tesseract-ocr tesseract-ocr-data-bul tesseract-ocr-dev
