FROM xena/alpine

ARG zig_version=0.5.0+c3d8b1ffe
ARG zig_url=https://ziglang.org/builds/zig-linux-x86_64-${zig_version}.tar.xz

RUN apk --no-cache add xz tar wget \
 && wget -O /zig.tar.xz $zig_url \
 && tar xf zig.tar.xz \
 && rm /zig.tar.xz
ENV PATH $PATH:/zig-linux-x86_64-$zig_version
