FROM ubuntu:20.04 AS builder

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -qq -y && \
    apt upgrade -qq -y && \
    apt install -qq -y --no-install-recommends \
    ca-certificates \
    curl \
    git && \
    rm -rf /var/cache/apt/*

ARG GOVERSION=1.15.2
ARG GOOS=linux
ARG GOARCH=amd64

COPY download.sh /usr/local/bin

RUN download.sh ${GOVERSION} ${GOOS} ${GOARCH}

ENV PATH=/usr/local/go/bin:/usr/sbin:/usr/bin:/sbin:/bin:/go/bin
ENV GOROOT=/go

CMD ["/go/bin/go"]


