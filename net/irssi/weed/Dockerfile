FROM xena/irssi

RUN git clone https://github.com/ronilaukkarinen/weed ~/.irssi

# Prune
RUN cd ~/.irssi/scripts &&\
    rm nicklist.pl

RUN cd ~/.irssi && mkdir autorun && mv scripts/*.pl autorun &&\
    mv autorun scripts
