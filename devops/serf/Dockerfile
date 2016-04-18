FROM alpine:edge

ENV SERF_VERSION v0.7.0

ADD https://github.com/lalyos/docker-upx/releases/download/v3.91/upx /bin/upx

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
  apk update; apk upgrade && \
  apk add curl make git go gcc musl-dev openssl-dev && \
  mkdir /go && \
  export GOPATH=/go && \
  go get -u -tags ${SERF_VERSION} -ldflags -s github.com/hashicorp/serf && \
  echo "serf built" && \
  chmod +x /bin/upx && for file in /go/bin/* ; do upx -6 $file ; done && \
  mv /go/bin/* /usr/local/bin && \
  rm -rf /go && \
  apk del curl make git go gcc musl-dev openssl-dev && \
  rm -rf /var/cache/apk/*

CMD /usr/local/bin/serf
