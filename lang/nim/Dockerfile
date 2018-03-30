FROM xena/alpine

ENV PATH=$PATH:/opt/nim/bin:/root/.nimble/bin
ENV NIM_VERSION 0.18.0
ENV NIM_DOWNLOAD_URL http://nim-lang.org/download/nim-$NIM_VERSION.tar.xz

RUN apk add --no-cache --virtual nim-compiler-deps libc-dev gcc curl libgcc git perl xz tar && \
    apk add --no-cache libressl ca-certificates libcrypto1.0 libssl1.0 && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /opt && cd /opt && \
    curl -LO $NIM_DOWNLOAD_URL && \
    /usr/bin/tar xJf nim-$NIM_VERSION.tar.xz && rm -f nim-$NIM_VERSION.tar.xz && \
    mv nim-$NIM_VERSION nim && cd nim && \
    sh build.sh && \
    cd .. && git clone https://github.com/nim-lang/nimble.git && \
    cd nimble && \
    nim -d:release c -r src/nimble -y install

LABEL language Nim
LABEL version $NIM_VERSION
