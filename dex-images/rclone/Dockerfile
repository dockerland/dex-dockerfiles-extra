FROM alpine:3.4

#
# build context and pre-requisites
#

ENV DEXBUILD_DIR="/build"

RUN ( \
  mkdir -p "${DEXBUILD_DIR}" &&\
  apk add --no-cache \
    ca-certificates \
    openssl \
  &&\
true )

#WORKDIR ${DEXBUILD_DIR}


#
# application installation and user stubbing
#

RUN ( \
  URL="https://downloads-rclone-org-7d7d567e.cdn.memsites.com/rclone-v1.34-linux-amd64.zip" &&\
  MD5="5a51f7a7dfdd8c8a415611bd090a1ffe" &&\
  cd ${DEXBUILD_DIR} &&\
  wget -O archive.zip $URL &&\
  { [ "$(md5sum archive.zip | awk {'print $1'})" = "$MD5" ] || exit 99 ; } &&\
  unzip -q archive.zip &&\
  mv rclone-*/rclone /usr/bin/rclone &&\
  rm -rf ${DEXBUILD_DIR} &&\
true )


#
# container runtime configuration
#

ENTRYPOINT ["/usr/bin/rclone"]


#
# v1 dex-api
#

LABEL \
  org.dockerland.dex.api="v1" \
  org.dockerland.dex.docker_flags="--interactive --tty" \
