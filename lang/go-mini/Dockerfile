FROM xena/alpine

RUN apk add --no-cache go build-base git
ENV CGO_ENABLED 0
RUN go get github.com/Xe/x/version/go1.9.4

FROM xena/alpine
COPY --from=0 /root/go/bin/go1.9.4 /usr/local/bin/go
RUN ln -s /usr/local/bin/go /usr/local/bin/go1.9.4

LABEL language Go
LABEL version 1.9.4
