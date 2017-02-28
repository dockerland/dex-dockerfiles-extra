FROM alpine:edge

#
# dex ag:latest image
#

RUN apk add --no-cache xeyes
ENTRYPOINT ["xeyes"]


#
# v1 dex-api
#

LABEL \
  org.dockerland.dex.api="v1" \
  org.dockerland.dex.window="true"
