FROM fedora:22

RUN dnf -y install tar gzip

ADD http://builds.cuberite.org/job/Cuberite%20Linux%20x64%20Master/lastSuccessfulBuild/artifact/Cuberite.tar.gz /cuberite.tgz

RUN tar xf /cuberite.tgz &&\
    mkdir -p /minecraft/data &&\
    mv /MCServer /minecraft/server

ADD settings.ini /minecraft/data/settings.ini

WORKDIR /minecraft/data

EXPOSE 8080
EXPOSE 25565
EXPOSE 25575/udp

CMD ../server/MCServer
