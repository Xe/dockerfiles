FROM flitter/init

RUN apt-add-repository ppa:i2p-maintainers/i2p
RUN apt-get update &&\
    apt-get install i2p -y

RUN useradd --create-home i2p

USER i2p
ENV HOME /home/i2p

CMD /usr/bin/i2prouter console
