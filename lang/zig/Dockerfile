FROM xena/alpine

ARG zig_version=0.4.0+21ed9391
ARG zig_url=https://ziglang.org/builds/zig-linux-x86_64-${zig_version}.tar.xz

RUN apk --no-cache add xz tar wget \
 && wget -O /zig.tar.xz $zig_url \
 && tar xf zig.tar.xz \
 && rm /zig.tar.xz
ENV PATH $PATH:/zig-linux-x86_64-$zig_version
