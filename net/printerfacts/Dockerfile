FROM xena/alpine

ENV CC gcc

RUN apk add --no-cache alpine-sdk \
 && mkdir -p /src \
 && cd /src \
 && git clone https://github.com/qpfiffer/Printer-Facts-API /src/app \
 && git clone https://github.com/qpfiffer/38-Moths.git /src/38moths \
 && (cd /src/38moths && make && make install) \
 && cd /src/app \
 && make \
 && apk del alpine-sdk

ENV BACKPLANE_PROXY_URL http://127.0.0.1:8666

WORKDIR /src/app
CMD "./printer-facts"
