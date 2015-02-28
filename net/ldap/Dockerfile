FROM flitter/init
MAINTAINER Nick Stenning <nick@whiteink.com>

ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Configure apt
RUN apt-get -y update &&\
    LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y slapd &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Default configuration: can be overridden at the docker command line
ENV LDAP_ROOTPASS toor
ENV LDAP_ORGANISATION Acme Widgets Inc.
ENV LDAP_DOMAIN example.com

EXPOSE 389

ADD slapd.sh /etc/service/slapd/run
