FROM alpine

# Add Tini
ENV TINI_VERSION v0.8.3
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static /tini
RUN chmod +x /tini
ADD ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

# update to edge
ADD repositories /etc/apk/repositories
RUN apk update && apk upgrade && apk add runit
ADD runit/ /etc/system
