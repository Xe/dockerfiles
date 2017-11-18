#!/bin/sh

set -e
s6-svscan /etc/system &
exec /sbin/tini -- $*
