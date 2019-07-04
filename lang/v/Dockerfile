FROM xena/alpine AS build
WORKDIR /v
RUN set -x && apk --no-cache add build-base libexecinfo-dev curl curl-dev git \
 && git clone https://github.com/vlang/v /v \
 && cd /v/compiler \
 && make \
 && cd .. \
 && rm -rf .git \
 && du -sh /v /root/.vlang \
 && cp /v/compiler/v /usr/local/bin/v \
 && rm /v/compiler/v

FROM alpine:edge
RUN apk --no-cache add build-base libexecinfo curl-dev
COPY --from=build /v /v
COPY --from=build /root/.vlang/VROOT /root/.vlang/VROOT
COPY --from=build /usr/local/bin/v /usr/local/bin/v
