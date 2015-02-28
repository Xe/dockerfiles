# Dockerfile
# postfix/dovecot mailserver

FROM flitter/init
MAINTAINER 3846masa <3846masahiro+git@gmail.com>

RUN apt-get update && apt-get -y install postfix dovecot

ADD postfix /etc/postfix/

ADD dovecot/dovecot.conf /etc/dovecot/dovecot.conf
ADD dovecot/conf.d /etc/dovecot/conf.d/
ADD bashfile /usr/local/bin/

RUN chmod 111 /usr/local/bin/*mailuser /usr/local/bin/startup
RUN touch /etc/postfix/vmaps /etc/dovecot/passwd

RUN groupadd -g 5000 vmail && \
    useradd -m -u 5000 -g 5000 -s /sbin/nologin vmail

EXPOSE 25 110 143 587

ENTRYPOINT ["/sbin/my_init"]
CMD [""]
