from "alpine:edge"

copy "repositories", "/etc/apk/repositories"
copy "runit/", "/etc/system"

run "apk upgrade --no-cache"
run "apk add --no-cache --virtual xe-alpine-base tini ca-certificates runit"

env "BACKPLANE_AGENT_VERSION" => "1.2.2"
run %q[ apk add -U --no-cache wget ca-certificates \
     && wget https://bin.equinox.io/c/jWahGASjoRq/backplane-stable-linux-amd64.tgz \
     && tar xf backplane-stable-linux-amd64.tgz \
     && mv backplane /usr/bin/backplane \
     && rm backplane-stable-linux-amd64.tgz \
     && apk del wget ]

copy "./entrypoint.sh", "/usr/sbin/entrypoint.sh"
entrypoint "/usr/sbin/entrypoint.sh"

flatten
tag "xena/alpine"
