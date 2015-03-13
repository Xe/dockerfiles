FROM ubuntu:trusty

RUN apt-get update && apt-get install irssi git-core -y

# create smurf user
RUN addgroup user && adduser --ingroup user --disabled-password user

ENV HOME /home/user
ENV LC_CTYPE en_US.UTF-8

USER user
RUN git clone https://github.com/ronilaukkarinen/weed ~/.irssi

# Prune
RUN cd ~/.irssi/scripts &&\
    rm nicklist.pl

RUN cd ~/.irssi && mkdir autorun && mv scripts/*.pl autorun &&\
    mv autorun scripts

CMD irssi
