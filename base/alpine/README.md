# `xena/alpine`

This is a cut of Alpine Linux Edge with `runit(8)` for process supervision and zombie management. I use this for my projects when I can because it doesn't suck as much. Just do this like you would with Phusion's base image and everything will be fine.

This also includes the [`backplane`](https://www.backplane.io) agent to make deployment easier. Usage:

```console
$ docker run \
    -e BACKPLANE_TOKEN=<token> \
    -e BACKPLANE_LABELS='hello:world' \
    -e BACKPLANE_PROXY_URL=https://127.0.0.1:9090 \
    xena/alpine
```
