FROM fedora:22

RUN dnf -y install tar gzip

ADD http://builds.cuberite.org/job/Cuberite%20Linux%20x64%20Master/lastSuccessfulBuild/artifact/Cuberite.tar.gz /cuberite.tgz

RUN tar xf /cuberite.tgz &&\
    mv /MCServer /minecraft

ADD settings.ini /minecraft/settings.ini

WORKDIR /minecraft

EXPOSE 8080
EXPOSE 25565

CMD ./MCServer
