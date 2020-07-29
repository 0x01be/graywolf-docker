FROM alpine:3.12.0 as builder

RUN apk add --no-cache --virtual build-dependencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    git \
    build-base \
    cmake \
    gsl-dev \
    libx11-dev \
    xf86-video-dummy \
    xorg-server

RUN git clone --depth 1 https://github.com/rubund/graywolf /graywolf

RUN mkdir /graywolf/build/
WORKDIR /graywolf/build

RUN cmake ..
RUN make
RUN make install

