#!/bin/sh

zig_version="$(basename $(curl https://ziglang.org/download/index.json | jq '.master["x86_64-linux"].tarball') | cut -d- -f4- | cut -d. -f1-3)"
image_tag="$(echo $zig_version | tr + -)"

docker build -t xena/zig:$image_tag --build-arg=zig_version=$zig_version .
docker push xena/zig:$image_tag
