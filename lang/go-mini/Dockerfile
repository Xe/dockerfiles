FROM xena/alpine

RUN apk add --no-cache go build-base git
RUN go get golang.org/x/build/version/go1.10.1

FROM xena/alpine
COPY --from=0 /root/go/bin/go1.10.1 /usr/local/bin/go
RUN ln -s /usr/local/bin/go /usr/local/bin/go1.10.1

LABEL language Go
LABEL version 1.10.1
