#!/bin/sh

set -e

runsvdir /etc/system &

exec /tini -- $*
