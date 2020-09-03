FROM alpine:3.9

MAINTAINER frederic.cabestre [at] easymile.com

ENV PATH="/usr/local/asdf/bin:/usr/local/asdf/shims:$PATH" \
    ASDF_ERLANG_VERSION=23.0.3

WORKDIR /usr/local

RUN apk add --no-cache --update \
    # Erlang Build dependencies, removed in the end
    autoconf=2.69-r2 \
    bash=4.4.19-r1 \
    curl=7.64.0-r3 \
    dpkg-dev=1.19.2-r0 \
    g++=8.3.0-r0 \
    gcc=8.3.0-r0 \
    git=2.20.4-r0 \
    libssh-dev=0.7.6-r2 \
    make=4.2.1-r2 \
    ncurses-dev=6.1_p20190105-r0 \
    openssl-dev=1.1.1g-r0 \

    # Runtime dependencies
    libcrypto1.1=1.1.1g-r0 \
    openssh-client=7.9_p1-r6 && \

    git clone https://github.com/asdf-vm/asdf.git /usr/local/asdf --branch v0.2.0 && \
    asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git && \
    asdf install erlang "$ASDF_ERLANG_VERSION" && \

    apk del --no-cache dpkg-dev autoconf libssh-dev openssl-dev ncurses-dev && \
    rm -rf /var/cache/apk/*
