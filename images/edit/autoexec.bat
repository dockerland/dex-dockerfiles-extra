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
lredir w: linux\fs/dex/workspace
lredir r: linux\fs/dex/rootfs
unix -s DEX_DOCKER_WORKSPACE_DOS
R:
cd %DEX_DOCKER_WORKSPACE_DOS%
unix -e
