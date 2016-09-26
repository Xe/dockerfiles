FROM xena/alpine

RUN apk add --no-cache g++ git
RUN git clone git://github.com/nim-lang/Nim.git nim&&\
    cd nim&& git clone --depth 1 git://github.com/nim-lang/csources&&\
    cd csources&& sh build.sh&& chmod +x ../bin/nim&&\
    cd /nim&& bin/nim c koch&& ./koch boot -d:release&&\
    ln -s `pwd`/bin/nim /bin/nim
RUN git clone https://github.com/nim-lang/nimble.git&&\
    cd nimble&& nim -d:release c -r src/nimble -y install&&\
    ln -s `pwd`/nimble /bin/nimble
