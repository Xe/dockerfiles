FROM alpine:edge

RUN apk upgrade --no-cache \
 && apk add --no-cache ca-certificates \
 && apk add --no-cache --virtual xe-alpine-base \
      -X https://xena.greedo.xeserv.us/pkg/alpine/edge/core/ --allow-untrusted \
      xeserv-repo tini s6 libc6-compat \
 && ln -s /usr/lib/libncurses.so.5 /usr/lib/libtinfo.so.5

COPY ./entrypoint.sh /usr/sbin/entrypoint.sh
ENTRYPOINT ["sh", "/usr/sbin/entrypoint.sh"]

COPY svc/ /etc/system

LABEL distro Alpine Linux
