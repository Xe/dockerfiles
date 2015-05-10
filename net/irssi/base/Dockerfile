FROM irssi

USER root
RUN apt-get update && apt-get install git

USER user
# I use tmux in 256 color mode. Too bad if you don't.
ENV TERM screen-256color
