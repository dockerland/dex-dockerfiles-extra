FROM jess/chrome

#
# v1 dex-api
#

# @TODO alleviate --cap-add=SYS_ADMIN on ArchLinux

LABEL \
  org.dockerland.dex.api="v1" \
  org.dockerland.dex.docker_flags="--cpuset-cpus=0 --net=host" \
  org.dockerland.dex.docker_devices="snd dri video0 usb /dev/bus/usb" \
  org.dockerland.dex.docker_volumes="/dev/shm /etc/localtime:/etc/localtime:ro" \
  org.dockerland.dex.docker_home="~" \
  org.dockerland.dex.window="true"

#
# chrome image
#

CMD ["--force-device-scale-factor=1"]
