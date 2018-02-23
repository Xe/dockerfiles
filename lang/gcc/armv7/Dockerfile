FROM xena/alpine
ADD https://skarnet.org/toolchains/cross/arm-linux-musleabihf-armv7-vfpv3-7.1.0.tar.xz /usr/local/lib/toolchain/
RUN cd /usr/local/lib/toolchain && tar xf arm-linux-musleabihf-armv7-vfpv3-7.1.0.tar.xz
ENV PATH $PATH:/usr/local/lib/toolchain/arm-linux-musleabihf-armv7-vfpv3-7.1.0/bin
