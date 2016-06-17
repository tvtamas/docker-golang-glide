#Golang  

Docker image with [Golang](https://golang.org/), [Glide](https://glide.sh) and [gometalinter](https://github.com/alecthomas/gometalinter)

Note: The image is based on the official golang image.

##Usage

Dockerfile:

```Dockerfile
FROM tvtamas/golang

RUN mkdir -p /go/src/github.com/tvtamas/example
WORKDIR /go/src/github.com/tvtamas/example

COPY glide.yaml
COPY glide.lock

# install dependencies with glide
RUN glide install -s -v

# copy source and build
COPY . /go/src/github.com/tvtamas/example
RUN go-wrapper build

# run the built binary
CMD ["go-wrapper", "run"]
```
