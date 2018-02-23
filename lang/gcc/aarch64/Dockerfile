FROM xena/alpine
ADD https://skarnet.org/toolchains/cross/aarch64-linux-musl-7.3.0.tar.xz /usr/local/lib/toolchain/
RUN cd /usr/local/lib/toolchain && tar xf aarch64-linux-musl-7.3.0.tar.xz 
ENV PATH $PATH:/usr/local/lib/toolchain/aarch64-linux-musl-7.3.0/bin
