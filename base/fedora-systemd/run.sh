#!/bin/bash

docker run --stop-signal=37 -ti -v /sys/fs/cgroup:/sys/fs/cgroup -v /tmp/$(mktemp -d):/run docker.io/xena/fedora-systemd
