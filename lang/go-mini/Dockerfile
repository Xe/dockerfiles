FROM xena/alpine AS build

ARG version=1.11

RUN apk add --no-cache go build-base git

# XXX(Xe): fix this for now
#RUN go get -d golang.org/x/build/version/go${version} \
# && go build -o /go golang.org/x/build/version/go${version}
COPY main.go /tmp/go/main.go
RUN go build -mod=vendor -o /go /tmp/go/main.go
# </XXX>

FROM xena/alpine

ARG version

COPY --from=build /go /usr/local/bin/go
RUN ln -s /usr/local/bin/go /usr/local/bin/go"${version}"

ENV GO_VERSION $version

LABEL language Go
LABEL version $version
