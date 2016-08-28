FROM briceburg/dosemu2:dex

#
# dex rebdecchess:latest image
#

# add app to c:\
RUN mkdir /etc/dosemu/drives/c/app && cd /etc/dosemu/drives/c/app &&  \
  curl -L http://www.rebel.nl/download/rebdec30.zip > rebdec30.zip && \
  unzip rebdec30.zip && \
  chmod -R 777 /etc/dosemu/drives/c/app


COPY app.bat /etc/dosemu/drives/c/app.bat

ENV \
  DOSEMU_CMD="c:\app.bat" \
  DOSEMU_FLAGS=""


#
# v1 dex-api
#


LABEL \
  org.dockerland.dex.window="true"
