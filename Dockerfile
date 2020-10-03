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

# Below the end result of multi-stage

FROM ubuntu:20.04
ENV PATH=/usr/local/go/bin:/usr/sbin:/usr/bin:/sbin:/bin:/go/bin
COPY --from=builder /go /go
CMD ["/go/bin/go"]


