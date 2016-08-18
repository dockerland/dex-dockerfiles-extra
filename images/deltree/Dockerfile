FROM briceburg/dosemu:latest

#
# v1 dex-api
#

LABEL org.dockerland.dex.api="v1"
LABEL org.dockerland.dex.docker_flags="-it"
LABEL org.dockerland.dex.docker_home="deltree"

#
# deltree image
#

# set dosemu keyboard layout. to change, run:
#  export DEX_DOCKER_FLAGS="-e DOSEMU_LAYOUT=<layout>"
#
# accepted layouts:
#   finnish(-latin1), de(-latin1), be, it, us, uk, dk(-latin1),
#   keyb-no, no-latin1, dvorak, pl, po, sg(-latin1), fr(-latin1), sf(-latin1),
#   es(-latin1), sw, hu(-latin2), hu-cwi, keyb-user, hr-cp852, hr-latin2,
#   cz-qwerty, cz-qwertz, ru, tr.

# @TODO move keyboard layout detection upstream, add entrypoint strategy.
ENV DOSEMU_LAYOUT="us"
COPY autoexec.bat /etc/dosemu/freedos/autoexec.bat
RUN chmod 777 /etc/dosemu/dosemu.conf

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
