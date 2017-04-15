from "alpine:edge"

copy "repositories", "/etc/apk/repositories"
copy "runit/", "/etc/system"
copy "bin/", "/bin"

run "apk upgrade --no-cache"
run "apk add --no-cache --virtual xe-alpine-base tini ca-certificates runit libc6-compat"

# if libtinfo.so.5 is used, install ncurses5-libs via apk
run "ln -s /usr/lib/libncurses.so.5 /usr/lib/libtinfo.so.5"

run %q[ apk add -U --no-cache wget \
     && wget https://xena.greedo.xeserv.us/pkg/alpine/edge/core/x86_64/xeserv-keys-1.3-r0.apk \
     && apk add --allow-untrusted ./xeserv-keys-1.3-r0.apk \
     && rm ./xeserv-keys-1.3-r0.apk \
     && apk del wget ]

copy "./entrypoint.sh", "/usr/sbin/entrypoint.sh"
entrypoint "/usr/sbin/entrypoint.sh"

flatten
tag "xena/alpine"
