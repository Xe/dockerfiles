FROM alpine:edge

ENV CONSUL_VERSION v0.6.4

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
  apk update; apk upgrade && \
  apk add curl make git go gcc musl-dev openssl-dev && \
  mkdir /go && \
  export GOPATH=/go && \
  go get -u -tags ${CONSUL_VERSION} github.com/hashicorp/consul && \
  echo "consul built" && \
  mv /go/bin/* /usr/local/bin && \
  rm -rf /go && \
  apk del make git go gcc musl-dev openssl-dev && \
  rm -rf /var/cache/apk/*

CMD /usr/local/bin/consul
