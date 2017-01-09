FROM xena/alpine

RUN apk --no-cache add mpd && mkdir -p /.mpd/playlists

ADD mpd.conf /etc/mpd.conf
ENV BACKPLANE_PROXY_URL http://127.0.0.1:7034

ADD run.sh /run.sh
CMD /run.sh
