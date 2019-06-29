FROM golang:1.12-alpine

RUN apk add ca-certificates curl git --no-cache

RUN go get -u github.com/githubnemo/CompileDaemon
WORKDIR /go/src/github.com/githubnemo/CompileDaemon
RUN go get ./...
RUN go build -o /usr/bin/CompileDaemon .

WORKDIR /go

ENTRYPOINT ["CompileDaemon"]
