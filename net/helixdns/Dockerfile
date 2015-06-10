FROM flitter/init

RUN apt-get update && apt-get install -y golang git mercurial --no-install-recommends && mkdir /go

ENV GOPATH /go

RUN go get github.com/mrwilson/helixdns

ADD helixdns /etc/service

EXPOSE 53/udp

ENTRYPOINT /sbin/my_init
