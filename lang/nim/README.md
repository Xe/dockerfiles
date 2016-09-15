
## Overview

NOTE: The image has moved to: https://registry.hub.docker.com/u/coopernurse/docker-nim/

This is a quick attempt to get the Nim compiler and nimble package manager
bundled into a Docker image.

The base image is Alpine Linux (see: https://registry.hub.docker.com/_/alpine/)
which keeps things slim.

## Layout

Nim is compiled from the latest github source and is in: `/opt/Nim`

nimble is also compiled from source, but only the compiled binary is kept.

`PATH` is updated to include: `/opt/Nim/bin` and `/root/.nimble/bin` so both
`nim` and `nimble` will be in the PATH by default.

`WORKDIR` is set to `/src` so if you `-v` mount your local directory to `/src` you can run the
compiler directly without changing directory first.

## Usage

By using the `-v` flag with `docker run` you can use this image to compile your Nim sources without
a local Nim installation.  For example, to compile and run `hello.nim` from this repo:

    docker run --rm -v `pwd`:/src coopernurse/docker-nim nim c -r --verbosity:0 hello.nim

Or to compile to a binary:

    docker run --rm -v `pwd`:/src coopernurse/docker-nim nim c hello.nim

