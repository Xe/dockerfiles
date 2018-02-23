FROM xena/alpine
ADD https://skarnet.org/toolchains/cross/powerpc-linux-musl-7.3.0.tar.xz /usr/local/lib/toolchain/
RUN cd /usr/local/lib/toolchain && tar xf powerpc-linux-musl-7.3.0.tar.xz 
ENV PATH $PATH:/usr/local/lib/toolchain/powerpc-linux-musl-7.3.0/bin
