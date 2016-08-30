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
