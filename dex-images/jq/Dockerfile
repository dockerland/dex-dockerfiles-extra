FROM alpine:3.4

#
# dex jq:latest image
#

RUN apk add --update \
    jq \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["jq"]


#
# v1 dex-api
#

LABEL \
  org.dockerland.dex.api="v1" \
  org.dockerland.dex.docker_flags="--interactive --tty"
