FROM briceburg/dosemu:latest

#
# v1 dex-api
#

LABEL org.dockerland.dex.api="v1"
LABEL org.dockerland.dex.docker_flags="--interactive --tty -v /:/dex/rootfs:rw"
LABEL org.dockerland.dex.docker_home="edit"

#
# edit image
#

RUN chmod 777 /etc/dosemu/dosemu.conf ; \
   echo "\$_cpu_emu = \"vm86\"" >> /etc/dosemu/dosemu.conf ; \
   echo "\$_cdrom  = \"\"" >> /etc/dosemu/dosemu.conf ; \
   echo "all nosuidroot guest" >> /etc/dosemu/dosemu.users


COPY autoexec.bat /etc/dosemu/freedos/autoexec.bat
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
