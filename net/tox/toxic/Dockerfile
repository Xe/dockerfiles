FROM ubuntu:14.04

ADD https://repo.tox.im/pubkey.gpg /tox.gpg

#remove old key
RUN apt-key update &&\
    echo "deb https://repo.tox.im/ nightly main" > /etc/apt/sources.list.d/tox.list &&\
    cat /tox.gpg | apt-key add - &&\
    apt-get install -y apt-transport-https && apt-get update -qq &&\
    apt-get install -y toxic

CMD toxic
