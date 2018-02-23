FROM xena/alpine
ADD https://skarnet.org/toolchains/cross/i486-linux-musl-7.3.0.tar.xz /usr/local/lib/toolchain/
RUN cd /usr/local/lib/toolchain && tar xf i486-linux-musl-7.3.0.tar.xz 
ENV PATH $PATH:/usr/local/lib/toolchain/i486-linux-musl-7.3.0/bin
