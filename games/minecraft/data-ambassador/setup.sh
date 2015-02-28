#!/bin/sh

adduser minecraft -D

chown -R minecraft /minecraft/server
chmod -R 777 /minecraft/server

