FROM flitter/init

RUN apt-get update && apt-get install cmake libmpdclient-dev git-core ca-certificates -y build-essential gcc make

RUN git clone https://github.com/notandy/ympd /app/src && \
    cd /app/src && \
    mkdir build && cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX_PATH=/usr && make && make install

ADD ympd /etc/service/ympd/run
CMD /sbin/my_init

EXPOSE 8080
