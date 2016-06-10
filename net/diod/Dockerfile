FROM alpine:edge

RUN apk add -U --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing diod

EXPOSE 564
VOLUME /data

CMD diod -e /data --nwthreads 4 -f $DIOD_OPTIONS
