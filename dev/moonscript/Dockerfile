FROM xena/base

RUN apt-get update && apt-get upgrade -y && \
    apt-get install --assume-yes liblua5.1-dev lua5.1 luajit luarocks \
    build-essential make git mercurial wget curl

RUN luarocks install --server=http://rocks.moonscript.org moonrocks
RUN moonrocks install moonscript
