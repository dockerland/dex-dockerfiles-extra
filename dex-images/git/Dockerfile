FROM briceburg/nss_wrapper:dex

#
# dex git:latest image
#

ENTRYPOINT ["/nss-wrap.sh", "git"]


#
# v1 dex-api
#

LABEL \
  org.dockerland.dex.api="v1" \
  org.dockerland.dex.docker_home="~"
# ^^^ bind mount HOME to user's real home
