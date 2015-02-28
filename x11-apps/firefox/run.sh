#!/bin/sh

docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/xena/Downloads:/home/developer/Downloads -v /home/xena/.mozilla:/home/developer/.mozilla xena/firefox
