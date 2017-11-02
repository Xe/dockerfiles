from "alpine:edge"

copy "runit/", "/etc/system"
copy "bin/", "/bin"

run "apk upgrade --no-cache"
run "apk add --no-cache --virtual xe-alpine-base tini ca-certificates runit libc6-compat"
run "apk --no-cache -X https://xena.greedo.xeserv.us/pkg/alpine/edge/core/ --allow-untrusted add xeserv-repo"

# if libtinfo.so.5 is used, install ncurses5-libs via apk
run "ln -s /usr/lib/libncurses.so.5 /usr/lib/libtinfo.so.5"

copy "./entrypoint.sh", "/usr/sbin/entrypoint.sh"
entrypoint "/usr/sbin/entrypoint.sh"

flatten
tag "xena/alpine"
