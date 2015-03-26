FROM flitter/init

RUN wget -O /tmp/drone.deb http://downloads.drone.io/master/drone.deb && \
    dpkg -i /tmp/drone.deb && \
    apt-get -f install # Sun Oct 26 10:23:45 PDT 2014

ADD drone /etc/service/drone/run
CMD /sbin/my_init

EXPOSE 8000
