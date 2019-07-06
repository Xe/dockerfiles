FROM alpine:edge

RUN apk upgrade --no-cache \
 && apk add --no-cache ca-certificates wget \
 && apk add --no-cache --virtual xe-alpine-base \
      -X https://xena.greedo.xeserv.us/pkg/alpine/edge/core/ --allow-untrusted \
      xeserv-repo tini s6 \
 && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
 && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk \
 && apk add glibc-2.29-r0.apk \
 && rm glibc-2.29-r0.apk \
 && ln -s /usr/lib/libncurses.so.5 /usr/lib/libtinfo.so.5

COPY ./entrypoint.sh /usr/sbin/entrypoint.sh
ENTRYPOINT ["sh", "/usr/sbin/entrypoint.sh"]

COPY svc/ /etc/system

LABEL distro Alpine Linux
