FROM flitter/init

RUN apt-get update &&\
    apt-get install -y \
      libssl-dev \
      libperl-dev \
      libicu-dev \
      pkg-config \
      tcl8.5-dev \
      libsasl2-dev \
      build-essential \
      g++ \
      python3-dev &&\
    useradd --create-home znc

USER znc
WORKDIR /home/znc

ENV ZNC_VERSION 1.6.1

RUN mkdir src &&\
    cd src &&\
    wget http://znc.in/releases/znc-1.6.1.tar.gz &&\
    tar xf znc-1.6.1.tar.gz &&\
    cd znc-1.6.1 &&\
    ./configure --enable-python --prefix /home/znc/run &&\
    make -j4 &&\
    make install


