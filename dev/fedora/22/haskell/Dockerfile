FROM xena/base

ADD https://s3.amazonaws.com/download.fpcomplete.com/centos/7/fpco.repo /etc/yum.repos.d/fpco.repo
RUN dnf install -y stack

USER xena
CMD /bin/zsh
