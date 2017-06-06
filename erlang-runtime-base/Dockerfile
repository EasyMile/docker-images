FROM alpine:3.5

MAINTAINER frederic.cabestre [at] easymile.com

RUN apk add --no-cache --update \
        ca-certificates=20161130-r1 \       
        libcrypto1.0=1.0.2k-r0 \  
        ncurses-libs=6.0-r7 &&         \
        mkdir -p /release/config && \
        rm -rf /var/cache/apk/*

ENTRYPOINT ["/release/bin/boot"]
