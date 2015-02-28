FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install busybox

RUN busybox wget http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb
RUN sudo dpkg -i influxdb_latest_amd64.deb
RUN rm influxdb_latest_amd64.deb

EXPOSE 8086
EXPOSE 8083

CMD /usr/bin/influxdb -config /opt/influxdb/shared/config.toml
