FROM flitter/init

RUN apt-get update && apt-get install openjdk-7-jre-headless -y

RUN useradd --create-home minecraft

ADD ./eula.txt /minecraft/data/eula.txt
ADD ./server.properties /minecraft/data/server.properties
ADD https://s3.amazonaws.com/Minecraft.Download/versions/1.10.2/minecraft_server.1.10.2.jar /minecraft/minecraft_server.jar
ADD runit/ /etc/service

RUN chmod a+r /minecraft/minecraft_server.jar

VOLUME /minecraft/data

EXPOSE 25565
EXPOSE 25575/udp

CMD /sbin/my_init
