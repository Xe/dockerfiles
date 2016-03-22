#!/bin/bash

images="haskell lisp nim"
base="docker.io/xena/dotfiles"

docker pull $base

for image in $images
do
	(
		docker rmi $base"-"$image
		docker build -t $base"-"$image $image
		docker push $base"-"$image
	)
done

wait
