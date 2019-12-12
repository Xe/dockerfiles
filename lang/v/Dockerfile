FROM xena/alpine AS build
WORKDIR /v
RUN set -x && apk --no-cache add build-base libexecinfo-dev curl curl-dev git \
 && git clone https://github.com/vlang/v /v \
 && make \
 && cd .. \
 && rm -rf .git \
 && du -sh /v \
 && cp /v/v /usr/local/bin/v

FROM alpine:edge
RUN apk --no-cache add build-base libexecinfo curl-dev
COPY --from=build /v /v
COPY --from=build /usr/local/bin/v /usr/local/bin/v
