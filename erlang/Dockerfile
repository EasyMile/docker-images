FROM alpine:3.6

MAINTAINER frederic.cabestre [at] easymile.com

ENV PATH="/usr/local/asdf/bin:/usr/local/asdf/shims:$PATH" \
    ASDF_ERLANG_VERSION=20.0

WORKDIR /usr/local

RUN apk add --no-cache --update \

    # Erlang Build dependencies, removed in the end
    autoconf=2.69-r0 \
    bash=4.3.48-r1 \
    curl=7.55.0-r0 \
    dpkg-dev=1.18.23-r2 \
    g++=6.3.0-r4 \
    gcc=6.3.0-r4 \
    git=2.13.5-r0 \
    libssh-dev=0.7.5-r1 \
    make=4.2.1-r0 \
    ncurses-dev=6.0-r8 \
    openssl-dev=1.0.2k-r0 \

    # Runtime dependencies
    libcrypto1.0=1.0.2k-r0 \
    openssh-client=7.5_p1-r1 && \

    git clone https://github.com/asdf-vm/asdf.git /usr/local/asdf --branch v0.2.0 && \
    asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git && \
    asdf install erlang "$ASDF_ERLANG_VERSION" && \

    apk del --no-cache dpkg-dev autoconf libssh-dev openssl-dev ncurses-dev && \
    rm -rf /var/cache/apk/*
