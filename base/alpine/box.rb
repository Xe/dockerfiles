from "alpine:edge"

copy "repositories", "/etc/apk/repositories"
copy "runit/", "/etc/system"

run "apk upgrade --no-cache"
run "apk add --no-cache --virtual xe-alpine-base tini ca-certificates runit libc6-compat"

# if libtinfo.so.5 is used, install ncurses5-libs via apk
run "ln -s /usr/lib/libncurses.so.5 /usr/lib/libtinfo.so.5"

env "BACKPLANE_AGENT_VERSION" => "1.2.3"
run %q[ apk add -U --no-cache wget ca-certificates \
     && wget https://bin.equinox.io/c/jWahGASjoRq/backplane-stable-linux-amd64.tgz \
     && tar xf backplane-stable-linux-amd64.tgz \
     && mv backplane /usr/bin/backplane \
     && rm backplane-stable-linux-amd64.tgz \
     && apk del wget ]

run %q[ apk add -U --no-cache curl \
     && cd /usr/bin && curl https://xena.greedo.xeserv.us/files/httpagent.gz -o httpagent.gz \
     && gunzip httpagent.gz \
     && chmod +x httpagent \
     && ./httpagent -help > /dev/null 2>&1 \
      ; apk del curl && echo upd: 2017-02-05 ]

# Add glue and vardene
run %q[ apk add -U --no-cache wget \
     && cd /usr/bin && wget https://xena.greedo.xeserv.us/files/glue \
     && chmod a+x /usr/bin/glue \
     && wget https://xena.greedo.xeserv.us/files/vardene \
     && chmod a+x /usr/bin/vardene \
     && cd /usr/local/share/ca-certificates \
     && wget https://xena.greedo.xeserv.us/files/ca.pem -O xeserv_ca.pem \
     && update-ca-certificates \
     && apk del wget ]

copy "./entrypoint.sh", "/usr/sbin/entrypoint.sh"
entrypoint "/usr/sbin/entrypoint.sh"

flatten
tag "xena/alpine"
