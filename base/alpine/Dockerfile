FROM alpine:edge

RUN apk add -U --no-cache tini

ADD ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

# Add Backplane agent
ENV BACKPLANE_AGENT_VERSION 1.1.5
RUN apk add -U --no-cache wget ca-certificates \
 && wget https://bin.equinox.io/c/jWahGASjoRq/backplane-stable-linux-amd64.tgz \
 && tar xf backplane-stable-linux-amd64.tgz \
 && mv backplane /usr/bin/backplane \
 && rm backplane-stable-linux-amd64.tgz \
 && apk del wget

# update to edge
ADD repositories /etc/apk/repositories
RUN apk add -U --no-cache runit
ADD runit/ /etc/system
