FROM ubuntu:14.04

RUN apt-get update # ba393330-1508-11e4-8c21-0800200c9a66
RUN apt-get -qqy upgrade # c4da4cc0-1508-11e4-8c21-0800200c9a66
RUN apt-get build-dep -qqy znc-python # 3e582310-1509-11e4-8c21-0800200c9a66
RUN apt-get install -qqy wget # 0501f510-150d-11e4-8c21-0800200c9a66
RUN apt-get install -qqy libssl-dev # 4b7d79b0-150d-11e4-8c21-0800200c9a66
RUN apt-get install -qqy git automake autoconf # 3bc47ee0-1514-11e4-8c21-0800200c9a66

RUN adduser znc --disabled-password

RUN cd /home/znc; mkdir src; cd src; git clone https://github.com/znc/znc; cd znc; bash ./autogen.sh ; bash ./configure --enable-openssl --prefix=/home/znc/znc --enable-python; make; make install # 79751510-150a-11e4-8c21-0800200c9a66

ADD znc.conf /home/znc/.znc/configs/znc.conf

ADD athemesasl.py /home/znc/znc/lib/znc/
ADD athemeauth.py /home/znc/znc/lib/znc/

RUN chmod -R 777 /home/znc

USER znc

EXPOSE 6667
EXPOSE 6697
EXPOSE 8080

ENV HOME /home/znc

RUN /home/znc/znc/bin/znc -p

CMD /home/znc/znc/bin/znc -f

