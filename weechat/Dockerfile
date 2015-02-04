FROM flitter/init

RUN apt-get update && apt-get -y upgrade && apt-get -y install dvtm dtach weechat
RUN useradd --create-home xena && echo 'xena:user' | chpasswd

ADD start.sh /
ADD http://repo.or.cz/w/dvtm.git/blob_plain/HEAD:/dvtm.info /tmp/
RUN tic -s /tmp/dvtm.info

ENV HOME /home/xena

CMD /sbin/my_init setuser xena /start.sh
