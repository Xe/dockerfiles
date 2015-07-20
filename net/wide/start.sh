#!/bin/bash

set -x
set -e

chown -R 3434:3434 /wide/app /wide/data
chmod -R a+rwx /wide/data

mkdir -p /wide/app/conf/users ||:
cp /wide/admin.json /wide/app/conf/users/admin.json

su wide '/run.sh'
