#!/bin/bash

chown -R 3434:3434 /wide/app /wide/data
chmod -R a+rwx /wide/data

su wide '/run.sh'
