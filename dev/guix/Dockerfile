FROM alpine

# Add Tini
ENV TINI_VERSION v0.8.3
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static /tini
RUN chmod +x /tini
ADD ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

ENV GUIX_VERSION 0.9.0
ENV PATH $PATH:/var/guix/profiles/default/guix-profile/bin

# update to edge
ADD repositories /etc/apk/repositories
RUN apk update && apk upgrade

# install guix in one pass
RUN set -x && apk update && apk add xz tar wget runit \
 && wget ftp://alpha.gnu.org/gnu/guix/guix-binary-0.9.0.x86_64-linux.tar.xz -O guix.tar.xz \
 && tar xJf guix.tar.xz \
 && rm guix.tar.xz \
 && addgroup guixbuild \
 && chmod 1775 /gnu/store \
 && ln -sf /var/guix/profiles/per-user/root/guix-profile ~root/.guix-profile \
 && mkdir -p /usr/local/bin \
 && cd /usr/local/bin \
 && ln -s /var/guix/profiles/per-user/root/guix-profile/bin/guix \
 && guix archive --authorize < ~root/.guix-profile/share/guix/hydra.gnu.org.pub \
 && adduser -S guix-builder guix-builder \
 && adduser guix-builder guixbuild

ADD runit/ /etc/system
