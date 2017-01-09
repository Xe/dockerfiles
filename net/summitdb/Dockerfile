FROM golang:1.7.1

RUN go get github.com/tidwall/summitdb/cmd/summitdb-server

VOLUME /data
EXPOSE 7481

CMD summitdb-server -dir /data -p 7481
