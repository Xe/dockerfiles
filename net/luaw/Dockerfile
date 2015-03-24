FROM flitter/init

RUN apt-get update && apt-get install -y build-essential make gcc g++ curl autotools-dev libtool autoconf libreadline-dev

# install lua 5.2
RUN mkdir /opt/install/lua-5.2 -p && cd /opt/install/lua-5.2 &&\
    curl -R -O http://www.lua.org/ftp/lua-5.2.3.tar.gz &&\
    tar zxf lua-5.2.3.tar.gz &&\
    cd lua-5.2.3 &&\
    make linux &&\
    make linux install

# libuv
RUN mkdir /opt/install/libuv-1.0 && cd /opt/install/libuv-1.0 &&\
    curl -R -o libuv-1.0.tgz https://codeload.github.com/libuv/libuv/tar.gz/v1.0.0 &&\
    tar zxf libuv-1.0.tgz &&\
    cd libuv-1.0.0 &&\
    sh autogen.sh &&\
    ./configure &&\
    make && make install

RUN mkdir /opt/install/luaw -p && cd /opt/install/luaw &&\
    curl -R -o luaw-master.tgz https://codeload.github.com/raksoras/luaw/tar.gz/master &&\
    tar zxf luaw-master.tgz &&\
    cd luaw-master &&\
    make linux &&\
    make INSTALL_ROOT=/app install
