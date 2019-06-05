FROM xena/alpine AS build

ARG version=1.12.5

RUN apk add --no-cache go build-base git

WORKDIR /tmp/go
COPY . .
RUN go build -v -mod=vendor -o /go

FROM xena/alpine

ARG version

COPY --from=build /go /usr/local/bin/go
RUN ln -s /usr/local/bin/go /usr/local/bin/go"${version}"

ENV GO_VERSION $version

LABEL language Go
LABEL version $version
