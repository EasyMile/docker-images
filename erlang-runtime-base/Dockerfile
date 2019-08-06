FROM alpine:3.9

MAINTAINER frederic.cabestre [at] easymile.com

RUN apk add --no-cache --update \
        ca-certificates=20190108-r0 \
        libcrypto1.1=1.1.1a-r1	 \
        openssl=1.1.1a-r1	 \
        ncurses-libs=6.1_p20190105-r0 \
        bash=4.4.19-r1 \
        jq=1.6-r0 \
        curl=7.63.0-r0 && \
        rm -rf /var/cache/apk/*

ENTRYPOINT ["/release/bin/boot"]
