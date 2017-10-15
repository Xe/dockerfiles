$goVer = "1.9"

from "xena/alpine"

gv = getenv "GO_VERSION"
if gv != "" then
  $goVer = gv
end

run "apk add --no-cache wget && cd /usr/local \
     && wget -O go.tgz https://storage.googleapis.com/golang/go#{$goVer}.linux-amd64.tar.gz \
     && tar xf go.tgz && rm go.tgz"

env "PATH" => "$PATH:/usr/local/go/bin"

flatten
tag "xena/go:#{$goVer}"
