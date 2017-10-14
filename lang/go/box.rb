$goVer = "1.9.1"
$goVerFam = "1.9"

from "xena/alpine"

run %q[ apk add --no-cache wget && cd /usr/local \
     && wget -O go.tgz https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz \
     && tar xf go.tgz && rm go.tgz ]

env "PATH" => "$PATH:/usr/local/go/bin"

flatten
tag "xena/go:#{$goVerFam}"
tag "xena/go:#{$goVer}"
