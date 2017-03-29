FROM alpine:3.4

ENV DOCTL_VERSION=1.6.0
WORKDIR /app

RUN apk add --no-cache curl && \
    mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 && \
    curl -L https://github.com/digitalocean/doctl/releases/download/v${DOCTL_VERSION}/doctl-${DOCTL_VERSION}-linux-amd64.tar.gz  | tar xz

ENTRYPOINT ["/app/doctl"]


# dex runtime

LABEL \
  org.dockerland.dex.api="v1" \
  org.dockerland.dex.docker_envars="DIGITALOCEAN_*"
