FROM l.gcr.io/google/bazel:latest

MAINTAINER clouway

RUN wget https://dl.google.com/go/go1.15.6.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz

ENV GOPATH=/tmp/gohome
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

RUN wget https://download.docker.com/linux/static/stable/x86_64/docker-20.10.1.tgz
RUN tar -C /usr/local -xzf docker-20.10.1.tgz

RUN bazel version

ENTRYPOINT ["bash", "-l", "-c"]
