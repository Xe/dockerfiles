from "xena/alpine"

run %q[ apk add -U openssl \
     && wget https://xena.greedo.xeserv.us/pkg/bin/go1.8-linux-amd64-glibc.gz -O go1.8.gz \
     && gunzip go1.8.gz && mv go1.8 /usr/local/bin \
     && apk del openssl]

flatten
tag "xena/go-mini:1.8"
