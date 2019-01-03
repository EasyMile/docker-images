FROM alpine:3.8

MAINTAINER frederic.cabestre [at] easymile.com

COPY Easymile-Root-Certificate-Authority-G1.crt /usr/local/share/ca-certificates/

RUN apk add --no-cache --update \
        ca-certificates=20171114-r3 \
        libcrypto1.0=1.0.2q-r0 \
        openssl=1.0.2q-r0 \
        ncurses-libs=6.1_p20180818-r1	 \
        bash=4.4.19-r1 \
        jq=1.6_rc1-r1 \
        curl=7.61.1-r1 && \
        rm -rf /var/cache/apk/* && \
        update-ca-certificates

ENTRYPOINT ["/release/bin/boot"]
