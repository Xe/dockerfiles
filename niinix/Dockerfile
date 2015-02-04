FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -qy upgrade
RUN apt-get install -yq cron

# Add init stuff
ADD init/init /init
ADD scripts/rc /etc/rc

# Test app
ADD app /app

ENTRYPOINT /init

