FROM xena/alpine

ARG nim_version=1.0.0

ENV PATH=$PATH:/opt/nim/bin:/root/.nimble/bin

RUN set -x && apk add --no-cache --virtual nim-compiler-deps libc-dev gcc curl libgcc git perl xz tar ca-certificates openssl-dev && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /opt && cd /opt && \
    curl -LO http://nim-lang.org/download/nim-$nim_version.tar.xz && \
    /usr/bin/tar xJf nim-$nim_version.tar.xz && rm -f nim-$nim_version.tar.xz && \
    mv nim-$nim_version nim && cd nim && \
    sh build.sh && \
    cd .. && git clone https://github.com/nim-lang/nimble.git && \
    cd nimble && \
    nim -d:release c -r src/nimble -y install

LABEL language Nim
LABEL version $nim_version
