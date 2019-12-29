FROM xena/alpine
ARG openresty_version=1.15.8.2
RUN apk add --no-cache alpine-sdk perl pcre-dev openssl-dev zlib-dev \
 && cd / && wget https://openresty.org/download/openresty-${openresty_version}.tar.gz \
 && tar xf openresty-${openresty_version}.tar.gz \
 && rm -rf openresty-${openresty_version}.tar.gz \
 && cd openresty-${openresty_version} \
 && ./configure --prefix=/usr/local/openresty \
 && make \
 && make install \
 && cd / && rm -rf openresty-${openresty_version}.tar.gz openresty-${openresty_version}
RUN wget https://luarocks.github.io/luarocks/releases/luarocks-3.2.1.tar.gz \
 && tar xf luarocks-3.2.1.tar.gz && cd luarocks-3.2.1 \
 && ./configure --prefix=/usr/local/openresty/luajit \
    --with-lua=/usr/local/openresty/luajit/ \
    --lua-suffix=jit \
    --with-lua-include=/usr/local/openresty/luajit/include/luajit-2.1 \
 && make \
 && make install \
 && cd / && rm -rf luarocks-3.2.1 luarocks-3.2.1.tar.gz
ENV PATH=$PATH:/usr/local/openresty/bin:/usr/local/openresty/luajit/bin
