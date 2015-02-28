FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get -y install openjdk-7-jre-headless

RUN apt-get -y install wget

RUN mkdir -p /minecraft/server

RUN adduser minecraft --home /minecraft/user --disabled-password --gecos "Minecraft daemon"

RUN chmod 777 /minecraft/server
RUN chown minecraft /minecraft/server

RUN wget -O /minecraft/server.jar http://dl.bukkit.org/latest-beta/craftbukkit-beta.jar

EXPOSE 25565

ADD start.sh /minecraft/start.sh
RUN chmod 777 /minecraft/start.sh

USER minecraft

CMD /minecraft/start.sh

