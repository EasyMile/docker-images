FROM alpine:3.8

MAINTAINER frederic.cabestre [at] easymile.com

ENV PATH="/usr/local/asdf/bin:/usr/local/asdf/shims:$PATH" \
    ASDF_ERLANG_VERSION=21.1

WORKDIR /usr/local

RUN apk add --no-cache --update \
    # Erlang Build dependencies, removed in the end
    autoconf=2.69-r2 \
    bash=4.4.19-r1 \
    curl=7.61.1-r0 \
    dpkg-dev=1.18.24-r0 \
    g++=6.4.0-r9 \
    gcc=6.4.0-r9 \
    git=2.18.0-r0 \
    libssh-dev=0.7.5-r3 \
    make=4.2.1-r2 \
    ncurses-dev=6.1_p20180818-r1 \
    openssl-dev=1.0.2p-r0 \

    # Runtime dependencies
    libcrypto1.0=1.0.2p-r0 \
    openssh-client=7.7_p1-r3 && \

    git clone https://github.com/asdf-vm/asdf.git /usr/local/asdf --branch v0.2.0 && \
    asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git && \
    asdf install erlang "$ASDF_ERLANG_VERSION" && \

    apk del --no-cache dpkg-dev autoconf libssh-dev openssl-dev ncurses-dev && \
    rm -rf /var/cache/apk/*
