FROM ubuntu:14.04

RUN apt-get install python2.7 python-dev python-pip git python-sqlite python-twisted-words

RUN git clone https://github.com/CarrotsAreMediocre/StarryPy

USER root

RUN pip install -r StarryPy/requirements.txt

USER starbound


