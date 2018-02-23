#!/bin/sh

for arch in aarch64 armv5t armv7 i486 i686 ppc ppc64 ppc64le x86_64
do
	docker build -t xena/gcc:$arch $arch &
done

wait
