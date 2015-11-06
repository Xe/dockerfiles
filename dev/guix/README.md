# Guix in Docker

Guix is cool, so is Docker, why not combine them?

```console
$ docker build -t xena/guix .
$ docker run --rm -it --privileged xena/guix /bin/sh
$ pstree
tini-+-runsvdir---runsv---run---guix-daemon
`-sh---pstree
$ guix package --install hello
$ hello
Hello, world!
```
