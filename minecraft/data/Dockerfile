FROM busybox

VOLUME /minecraft/server

ADD bukkit.yml /minecraft/server/
ADD server.properties /minecraft/server/
ADD start.sh /minecraft/

RUN chmod 777 /minecraft/start.sh
RUN chmod 777 /minecraft/server

CMD /minecraft/start.sh
