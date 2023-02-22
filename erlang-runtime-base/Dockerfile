FROM alpine:3.16.4

MAINTAINER frederic.cabestre [at] easymile.com

RUN apk add --no-cache --update \
        ca-certificates=20220614-r0 \
        libcrypto1.1=1.1.1t-r0	 \
        openssl=1.1.1t-r0	 \
        ncurses-libs=6.3_p20220521-r0 \
        bash=5.1.16-r2\
        jq=1.6-r1 \
        libstdc++=11.2.1_git20220219-r2 \
        curl=7.83.1-r6 && \
        rm -rf /var/cache/apk/*

ENTRYPOINT ["/release/bin/boot"]
