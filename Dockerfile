FROM golang:1.9

RUN go get -u github.com/githubnemo/CompileDaemon
WORKDIR /go/src/github.com/githubnemo/CompileDaemon
RUN go get ./...
RUN go build -o /usr/bin/CompileDaemon .

ENTRYPOINT ["CompileDaemon"]
