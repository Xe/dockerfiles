FROM xena/alpine
ADD https://skarnet.org/toolchains/native/x86_64-linux-musl-7.3.0.tar.xz /usr/local/lib/toolchain/
RUN cd /usr/local/lib/toolchain && tar xf x86_64-linux-musl-7.3.0.tar.xz 
ENV PATH $PATH:/usr/local/lib/toolchain/x86_64-linux-musl-7.3.0/bin
