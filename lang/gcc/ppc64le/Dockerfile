FROM xena/alpine
ADD https://skarnet.org/toolchains/cross/powerpc64le-linux-musl-7.3.0.tar.xz /usr/local/lib/toolchain/
RUN cd /usr/local/lib/toolchain && tar xf powerpc64le-linux-musl-7.3.0.tar.xz 
ENV PATH $PATH:/usr/local/lib/toolchain/powerpc64le-linux-musl-7.3.0/bin
