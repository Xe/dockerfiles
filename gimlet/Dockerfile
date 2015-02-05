FROM flitter/init
MAINTAINER Xena <xena@yolo-swag.com>

RUN apt-get update &&\
    apt-get -y install libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make curl git-core luarocks &&\
    luarocks install moonrocks --server=http://rocks.moonscript.org &&\
    moonrocks install gimlet-cocktail &&\
    moonrocks install moonscript &&\
    moonrocks install yaml &&\
    moonrocks install xavante &&\
    moonrocks install wsapi &&\
    moonrocks install wsapi-xavante

ADD prepare.moon /app/prepare.moon
ADD gimlet /etc/service/gimlet/run
ENTRYPOINT /sbin/my_init

ENV PORT 5000
EXPOSE 5000
ENV ENVIRONMENT docker

ONBUILD ADD app.yaml /app/
ONBUILD RUN moon /app/prepare.moon /app/app.yaml
ONBUILD ADD . /app/src
ONBUILD RUN moonc /app/src
