FROM alpine:3.5

MAINTAINER frederic.cabestre [at] easymile.com

ENV PATH="/usr/local/asdf/bin:/usr/local/asdf/shims:$PATH" \
    ERLANG_VERSION=19.3

WORKDIR /usr/local

RUN apk add --no-cache --update \

    # Erlang Build dependencies, removed in the end
    autoconf \
    bash \
    curl \
    dpkg-dev \
    g++ \
    gcc \
    git \
    libssh-dev \
    make \
    ncurses-dev \
    openssl-dev \

    # Runtime dependencies
    libcrypto1.0 \
    openssh-client && \

    git clone https://github.com/asdf-vm/asdf.git /usr/local/asdf --branch v0.2.0 && \
    asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git && \
    asdf install erlang "$ERLANG_VERSION" && \

    apk del --no-cache dpkg-dev autoconf libssh-dev openssl-dev ncurses-dev && \
    rm -rf /var/cache/apk/*
