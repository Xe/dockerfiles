from "xena/alpine"

run %q[ apk add --no-cache wget && cd /usr/local \
     && wget -O go.tgz https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz \
     && tar xf go.tgz && rm go.tgz ]

env "PATH" => "$PATH:/usr/local/go/bin"

flatten
tag "xena/go:1.8"
tag "xena/go:1.8.3"
