ARG alpine_version=3.10
FROM alpine:$alpine_version

ARG go_version=1.13.5
ENV GO_VERSION=$go_version
ENV CGO_ENABLED=0

RUN apk add --no-cache go build-base libc6-compat git~2 \
 && CGO_ENABLED=0 GO111MODULE=on go get golang.org/dl/go${go_version} \
 && mv /root/go/bin/go${go_version} /usr/local/bin/go \
 && apk del go build-base \
 && /usr/local/bin/go download \
 && rm /root/sdk/go${go_version}/go${go_version}.linux-amd64.tar.gz
