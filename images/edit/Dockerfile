FROM briceburg/dosemu:latest

#
# v1 dex-api
#

LABEL org.dockerland.dex.api="v1"
LABEL org.dockerland.dex.docker_flags="--interactive --tty"
LABEL org.dockerland.dex.docker_home="deltree"

# exposes host root as /dex/rootfs in container
LABEL org.dockerland.dex.expose_rootfs="rw"


#
# edit image
#

COPY autoexec.bat /etc/dosemu/freedos/autoexec.bat
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
