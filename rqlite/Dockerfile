FROM flitter/init

ENV GOPATH /go
ENV PATH $PATH:/go/bin

RUN apt-get update && apt-get -y install build-essential golang sqlite3 libsqlite3-dev git mercurial --no-install-recommends &&\
    mkdir /rqlite /go && go get github.com/otoolep/rqlite

EXPOSE 4001

ADD rqlite /etc/service/rqlite/run

CMD /sbin/my_init
