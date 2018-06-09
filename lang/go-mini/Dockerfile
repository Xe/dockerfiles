FROM xena/alpine AS build

ARG version=1.10.3

RUN apk add --no-cache go build-base git
RUN go get -d golang.org/x/build/version/go${version} \
 && go build -o /go golang.org/x/build/version/go${version}

FROM xena/alpine

ARG version

COPY --from=build /go /usr/local/bin/go
RUN ln -s /usr/local/bin/go /usr/local/bin/go"${version}"

LABEL language Go
LABEL version $version
