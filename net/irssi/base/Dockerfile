FROM ubuntu:trusty

RUN apt-get update && apt-get install irssi git-core -y

# create smurf user
RUN addgroup user && adduser --ingroup user --disabled-password user

ENV HOME /home/user
ENV LC_CTYPE en_US.UTF-8

# I use tmux in 256 color mode. Too bad if you don't.
ENV TERM screen-256color

USER user

CMD irssi
