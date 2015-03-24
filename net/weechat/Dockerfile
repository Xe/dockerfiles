FROM ubuntu:trusty

RUN echo "deb http://ppa.launchpad.net/nesthib/weechat-stable/ubuntu trusty main " >> /etc/apt/sources.list &&\
    apt-get update && apt-get -y --force-yes install weechat &&\
    useradd --create-home xena && echo 'xena:user' | chpasswd

ENV HOME /home/xena
ENV LANGUAGE en_US
ENV LC_ALL en_US.UTF-8
ENV LANG en_us.utf-8
ENV LC_CTYPE en_US.UTF-8
ENV TERM screen-256color

USER xena
CMD weechat
