FROM alpine:3.4

#
# dex gitk:latest image
#

RUN apk add --update \
    git-gitk \
    ttf-droid \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["gitk"]


#
# v1 dex-api
#

LABEL \
  org.dockerland.dex.api="v1" \
  org.dockerland.dex.docker_workspace="$(git rev-parse --show-toplevel)" \
  org.dockerland.dex.window="true"
