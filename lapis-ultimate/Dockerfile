FROM flitter/init
MAINTAINER Xena <xena@yolo-swag.com>

RUN apt-get update && \
    apt-get -y install libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make curl git-core luarocks lua-sec nodejs npm lua-discount

ENV SRC_DIR /opt
ENV OPENRESTY_VERSION 1.7.7.2
ENV OPENRESTY_PREFIX /app/openresty
ENV LAPIS_VERSION 1.1.0

RUN cd $SRC_DIR && curl -LO http://openresty.org/download/ngx_openresty-$OPENRESTY_VERSION.tar.gz &&\
    tar xzf ngx_openresty-$OPENRESTY_VERSION.tar.gz && cd ngx_openresty-$OPENRESTY_VERSION &&\
    ./configure --prefix=$OPENRESTY_PREFIX &&\
    make && make install && rm -rf ngx_openresty-$OPENRESTY_VERSION* &&\
    luarocks install lapis $LAPIS_VERSION &&\
    luarocks install moonscript &&\
    luarocks install moonbox &&\
    npm install -g coffee-script && npm install -g bower

ADD lapis /etc/service/lapis/run
ENTRYPOINT /sbin/my_init

ENV PORT 5000
EXPOSE 5000
ENV LAPIS_ENVIRONMENT docker

ONBUILD ADD BoxFile /app/src
ONBUILD RUN cd /app/src && moonbox install
ONBUILD ADD bower.json /app/src
ONBUILD RUN cd /app/src && bower install
ONBUILD ADD . /app/src
ONBUILD RUN moonc /app/src
ONBUILD RUN cd /app/src && bash -c 'coffee --compile --bare --no-header **/*.coffee'
