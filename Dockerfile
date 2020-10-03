FROM ubuntu:20.04 AS builder

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -qq -y && \
    apt upgrade -qq -y && \
    apt install -qq -y --no-install-recommends \
    ca-certificates \
    curl \
    git

ARG GOLANG_VERSION=1.15.2
ARG GOLANG_OS=linux
ARG GOLANG_ARCH=amd64

COPY download.sh /usr/local/bin

RUN download.sh ${GOLANG_VERSION} ${GOLANG_OS} ${GOLANG_ARCH}

ENV PATH=/usr/local/go/bin:/usr/sbin:/usr/bin:/sbin:/bin:/go/bin

CMD ["/go/bin/go"]


