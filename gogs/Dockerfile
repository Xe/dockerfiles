FROM flitter/init

RUN apt-get update && apt-get install -y openssh-server sqlite3 libsqlite3-0 git wget unzip &&\
    mkdir /gogs && cd /gogs && mkdir dl && cd dl &&\
    wget http://gogs.dn.qbox.me/gogs_v0.5.11_linux_amd64.zip -O /gogs/dl/gogs.zip &&\
    cd /gogs && unzip /gogs/dl/gogs.zip && mv gogs install &&\
    mkdir /gogs/data/repos -p && useradd git --create-home &&\
    echo 'git:user' | chpasswd && chown -R git /gogs/data && chmod 777 /gogs/data/repos &&\
    mkdir -p /var/run/sshd

ADD runit/ /etc/service
ADD gogs/ /gogs/install

RUN chown -R git /gogs/install

EXPOSE 3000
EXPOSE 22

CMD /sbin/my_init
