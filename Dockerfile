FROM golang:1.6.2

MAINTAINER Tamás Török-Vistai <ttamas@gmail.com>

ENV GLIDE_VERSION 0.11.0

ENV GLIDE_DOWNLOAD_URL https://github.com/Masterminds/glide/releases/download/v${GLIDE_VERSION}/glide-v${GLIDE_VERSION}-linux-amd64.tar.gz

RUN curl -fsSL "$GLIDE_DOWNLOAD_URL" -o glide.tar.gz \
    && tar -xzf glide.tar.gz \
    && mv linux-amd64/glide /usr/bin/ \
    && rm -r linux-amd64 \
    && rm glide.tar.gz

RUN go get github.com/alecthomas/gometalinter && \
    gometalinter --install --update
