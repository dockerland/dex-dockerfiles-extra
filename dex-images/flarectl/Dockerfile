FROM golang:1.8-alpine

RUN apk add --no-cache curl git &&\
    go get github.com/cloudflare/cloudflare-go &&\
    go install github.com/cloudflare/cloudflare-go/cmd/flarectl

ENTRYPOINT ["/go/bin/flarectl"]


# dex runtime

LABEL \
  org.dockerland.dex.api="v1" \
  org.dockerland.dex.docker_envars="CF_API_*"
