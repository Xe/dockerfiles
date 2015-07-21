FROM 32bit/ubuntu:14.04

RUN apt-get update && apt-get install -y --force-yes bzip2 wget

RUN mkdir /quassel/bin -p && cd /quassel/bin &&\
    wget http://quassel-irc.org/pub/quasselcore-static-0.12.2.bz2 &&\
    bzip2 -d quasselcore-static-0.12.2.bz2 &&\
    mv quasselcore-static-0.12.2 qcore &&\
    chmod u+x qcore

ADD ./run.sh /quassel/bin/run.sh
RUN mkdir /quassel/data

EXPOSE 4242

CMD /quassel/bin/run.sh
