FROM buildpack-deps:jessie
MAINTAINER Cadey Dodrill <me@christine.website>

RUN mkdir /nim -p
WORKDIR /nim

RUN wget http://nim-lang.org/download/nim-0.14.2.tar.xz \
 && tar xf nim-0.14.2.tar.xz \
 && mv nim-0.14.2 compiler \
 && cd compiler \
 && sh build.sh \
 && ln -s /nim/compiler/bin/nim /bin/nim \
 && cd .. \
 && rm nim-0.14.2.tar.xz \
 && git clone https://github.com/nim-lang/nimble.git \
 && cd nimble \
 && /nim/compiler/bin/nim -d:release c -r src/nimble -y install \
 && cd .. \
 && ln -s /nim/nimble/nimble /bin/nimble
