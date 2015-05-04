FROM flitter/init

RUN apt-get update && apt-get install -y quassel-core

ADD runit/ /etc/service

EXPOSE 4242

VOLUME /var/lib/quassel

CMD /sbin/my_init
