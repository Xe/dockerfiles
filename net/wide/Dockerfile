FROM golang:1.4.2

RUN groupadd -g 3434 wide
RUN adduser wide \
		--uid 3434 \
		--gid 3434 \
		--home /wide/data

USER wide
ADD ./wide-1.3.0-linux-amd64.tar.gz /wide/app
ADD ./style.css /wide/app/static/user/admin/style.css

USER root
ADD ./start.sh /
ADD ./run.sh /

EXPOSE 7070
CMD /start.sh
