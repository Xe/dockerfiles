FROM alpine:3.4

ENV PATH=$PATH:/opt/nim/bin:/root/.nimble/bin
ENV NIM_VERSION 0.14.0
ENV NIM_DOWNLOAD_URL http://nim-lang.org/download/nim-0.14.0.tar.xz

RUN apk update && \
    apk add libc-dev gcc curl libgcc git perl xz tar && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /opt && cd /opt && \
    curl -LO $NIM_DOWNLOAD_URL && \
    /usr/bin/tar xJf nim-$NIM_VERSION.tar.xz && rm -f nim-$NIM_VERSION.tar.xz && \
    mv nim-0.14.0 nim && cd nim && \
    sh build.sh && \
    cd .. && git clone https://github.com/nim-lang/nimble.git && \
    cd nimble && \
    nim -d:release c -r src/nimble -y install

LABEL language Nim
LABEL version $NIM_VERSION
LABEL distro Alpine Linux
