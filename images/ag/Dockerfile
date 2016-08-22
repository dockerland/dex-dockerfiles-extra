FROM alpine:3.4

#
# v1 dex-api
#

LABEL org.dockerland.dex.api="v1"
LABEL org.dockerland.dex.docker_flags="--interactive --tty"

#
# ag image
#

RUN apk add --update \
    the_silver_searcher \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["ag"]
