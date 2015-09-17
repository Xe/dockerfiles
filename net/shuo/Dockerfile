FROM node:4.0

RUN useradd --create-home shuo

RUN npm install -g shuo@0.53.1

ENV HOME /home/shuo

EXPOSE 9000

USER shuo

ADD . /home/shuo/.shuo

CMD shuo
