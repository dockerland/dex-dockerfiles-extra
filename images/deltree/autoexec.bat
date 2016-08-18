@echo off
path z:\bin;z:\gnu;z:\dosemu
set HELPPATH=z:\help
set TEMP=c:\tmp
prompt $P$G
unix -s DOSDRIVE_D
if "%DOSDRIVE_D%" == "" goto nodrived
lredir del d: > nul
lredir d: linux\fs%DOSDRIVE_D%
:nodrived
lredir g: linux\fs/dex/workspace
G:
unix -e
