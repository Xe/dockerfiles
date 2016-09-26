#!/bin/sh

set -e

runsvdir /etc/system &

exec /sbin/tini -- $*
