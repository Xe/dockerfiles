#!/bin/sh

export TERM=dvtm

dtach -A /tmp/weechat.dvtm -r winch dvtm 'weechat && killall dtach'
