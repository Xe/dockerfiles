FROM flitter/init

RUN bash -c 'source /etc/lsb-release && echo "deb http://download.rethinkdb.com/apt $DISTRIB_CODENAME main" | tee /etc/apt/sources.list.d/rethinkdb.list' &&\
    wget -qO- http://download.rethinkdb.com/apt/pubkey.gpg | apt-key add - &&\
    sudo apt-get update &&\
    sudo apt-get install rethinkdb -y --force-yes

RUN mkdir /db
WORKDIR /db
EXPOSE 29015
EXPOSE 28015
EXPOSE 8080

CMD rethinkdb --bind all
