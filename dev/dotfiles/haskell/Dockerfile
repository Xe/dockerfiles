FROM docker.io/xena/dotfiles

ADD https://s3.amazonaws.com/download.fpcomplete.com/fedora/23/fpco.repo /etc/yum.repos.d

USER root
RUN dnf -y install stack

USER xena
RUN stack setup

CMD fish -l
