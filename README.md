# dockerfiles

## tl;dr

To build every image: `$ mage all`

## xena/alpine

My custom spin of [Alpine Linux][alpine-linux] for containers with runit as a
process manager. This also starts syslog in every container and adds my custom
repo whose apkbuilds are at https://github.com/Xe/aports.

This is based on alpine edge. I can make a version based on a stable branch if
there is interest however.

## xena/go

My Go image. To update the version of Go, change the `goVersion` constant in `mage.go` and then run `$ mage go`.
