FROM alpine

RUN apk update && apk add alpine-sdk fuse-dev

RUN mkdir /usr/src

RUN cd /usr/src &&\
    git clone git://github.com/gittup/tup.git &&\
    cd tup &&\
    ./bootstrap.sh &&\
    cp tup /usr/local/bin/tup
