FROM alpine:edge

#
# dex ag:latest image
#

RUN apk add --update \
    socat \
    strace \
    xeyes\
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["xeyes"]


#
# v1 dex-api
#

LABEL \
  org.dockerland.dex.api="v1" \
  org.dockerland.dex.window="true"
