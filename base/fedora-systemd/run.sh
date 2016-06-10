#!/bin/bash

docker run --stop-signal=37 -ti -v /etc/machine-id:/etc/host-machine-id:ro -v /sys/fs/cgroup:/sys/fs/cgroup -v /tmp/$(mktemp -d):/run docker.io/xena/fedora-systemd
