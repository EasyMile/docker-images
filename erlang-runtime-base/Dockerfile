FROM alpine:3.6

MAINTAINER frederic.cabestre [at] easymile.com

COPY Easymile-Root-Certificate-Authority-G1.crt /usr/local/share/ca-certificates/

RUN apk add --no-cache --update \
        ca-certificates=20161130-r2 \
        libcrypto1.0=1.0.2k-r0 \
        ncurses-libs=6.0_p20170930-r0 \
        bash=4.3.48-r1 && \
        rm -rf /var/cache/apk/* && \
        update-ca-certificates

ENTRYPOINT ["/release/bin/boot"]
