FROM phusion/baseimage:latest

RUN \
  apt-get update && \
  apt-get install -y zip unzip wget && \
  wget -O /opt/xonotic.zip http://dl.xonotic.org/xonotic-0.8.0.zip && \
  unzip /opt/xonotic.zip -d /opt && \
  rm /opt/xonotic.zip && \
  cp /opt/Xonotic/server/server_linux.sh /opt/Xonotic/server_linux.sh

ADD ./server.cfg /opt/Xonotic/data/server.cfg

VOLUME ["/opt/Xonotic/data"]

WORKDIR /opt/Xonotic

CMD ["/sbin/my_init", "/opt/Xonotic/server_linux.sh"]

EXPOSE 26000/udp
