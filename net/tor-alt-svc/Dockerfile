FROM xena/alpine

RUN apk -U add tor
ADD torrc /etc/tor/torrc
VOLUME /data
CMD tor -f /etc/tor/torrc
