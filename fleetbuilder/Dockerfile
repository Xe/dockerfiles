FROM deis/go

RUN mkdir /tmp/build && \
    mkdir -p /go/src/github.com/coreos && cd /go/src/github.com/coreos && \
    git clone http://github.com/coreos/fleet && cd fleet && \
    ./build && cp bin/* /tmp/build
