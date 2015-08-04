FROM node:0

RUN useradd --create-home shout

RUN npm install -g shout

ENV HOME /home/shout

EXPOSE 9000

USER shout

ADD . /home/shout/.shout

CMD shout
