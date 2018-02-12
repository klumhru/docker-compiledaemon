FROM golang:1.9

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -yq \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"
RUN apt-get update
RUN apt-get install docker-ce -yq

RUN go get -u github.com/githubnemo/CompileDaemon
WORKDIR /go/src/github.com/githubnemo/CompileDaemon
RUN go get ./...
RUN go build -o /usr/bin/CompileDaemon .

ENTRYPOINT ["CompileDaemon", "-build=\"make test build\"", "-command=out/main"]
