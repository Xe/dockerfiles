FROM xena/alpine AS build
ADD https://xena.greedo.xeserv.us/files/wasmception-linux-amd64-01-28-2019.tar.gz /wasmception.tar.gz
RUN mkdir /wasmception
WORKDIR /wasmception
RUN tar -xzf /wasmception.tar.gz

FROM xena/alpine
COPY --from=build /wasmception /wasmception
RUN apk add --no-cache libstdc++ libexecinfo 
ENV PATH $PATH:/wasmception/dist/bin:/wasmception/sysroot/bin
ENV CLANG_OPTIONS --sysroot=/wasmception/sysroot -fdebug-prefix-map=/wasmception=wasmception://v0.2
