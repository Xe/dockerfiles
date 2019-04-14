FROM xena/alpine

RUN apk --no-cache add xz tar wget \
 && wget -O /zig.tar.xz https://ziglang.org/download/0.4.0/zig-linux-x86_64-0.4.0.tar.xz \
 && mkdir -p /zig \
 && tar xf zig.tar.xz \
 && rm /zig.tar.xz
ENV PATH $PATH:/zig
