# xeyes

the classic app for testing your X11 display, dexified.

## FAQ

### how can I exit

* use docker to kill the dex xeyes container
```sh
docker kill $(docker ps | grep xeyes:latest | awk '{ print $1 }')
```

* use `xkill`
```sh
xkill
# then click on the xeyes window
```

### how to debug the connection to X

`strace` is provided in the container to help debug, e.g.

```sh
dex run --entrypoint=sh xeyes

/dex/workspace # strace -e connect xeyes
# connect(3, {sa_family=AF_UNIX, sun_path=@"/tmp/.X11-unix/X0"}, 20) = -1 ECONNREFUSED (Connection refused)
# connect(3, {sa_family=AF_UNIX, sun_path="/tmp/.X11-unix/X0"}, 110) = -1 ECONNREFUSED (Connection refused)
# Error: Can't open display: unix:0
# +++ exited with 1 +++
```

The above shows an issue with the unix socket and we'll need to fix this.

#### confirm DEX_WINDOW_FLAGS

By default, we set `DEX_WINDOW_FLAGS` TO
```
DEX_WINDOW_FLAGS="-v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY"
```

On the local host, we can list files the X server has open via
`lsof -p <pid-of-X-Server>` to look for a /path/to/X0 file and confirm we
are passing the correct socket via `-v /tmp/.X11-unix:/tmp/.X11-unix` and `-e DISPLAY=$DISPLAY` flags.
`netstat -x | grep X` may also help ( thanks to [Stephane Chazelas](http://unix.stackexchange.com/a/57143))
