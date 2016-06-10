FROM alpine:3.3

RUN apk update
RUN apk add rtorrent rsync openssh

RUN adduser torrent -D -s /bin/sh
RUN echo "torrent:torrent" | chpasswd

RUN mkdir /torrents
RUN chown torrent /torrents
RUN chmod 777 /torrents

ADD rtorrent.rc /home/torrent/.rtorrent.rc

USER torrent

VOLUME /torrents
