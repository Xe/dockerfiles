#!/bin/sh

docker run -dit -v /home/xena --name hexchat-data xena/hexchat /bin/bash
docker run -ti -d --name hexchat -e DISPLAY=$DISPLAY --volumes-from hexchat-data -v /tmp/.X11-unix:/tmp/.X11-unix xena/hexchat
