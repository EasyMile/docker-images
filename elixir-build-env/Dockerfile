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

# Erlang

ENV ELIXIR_VERSION 1.7.3

WORKDIR /usr/local

RUN asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git && \
    asdf install elixir "$ELIXIR_VERSION"

# Elixir

RUN addgroup builder -g 1000 && \
    adduser builder -u 1000 -s /bin/ash -SDG builder && \
    apk add --update sudo && \
    echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER builder
WORKDIR /home/builder

RUN sudo apk add --no-cache --update \
    jq=1.6_rc1-r1 \
    protobuf=3.5.2-r0 \
    # Required to build `ShellCheck`
    ghc=8.4.3-r0 \
    cabal=2.2.0.0-r0 \
    libffi=3.2.1-r4 && \
    # Build ShellCheck
    cabal update && \
    cabal install ShellCheck-0.5.0 && \
    sudo cp .cabal/bin/shellcheck /usr/bin/shellcheck && \
    rm -rf .cabal/bin/shellcheck && \

    sudo chown builder. -R /usr/local/asdf && \
    sudo apk del --no-cache cabal ghc && \
    sudo rm -rf /var/cache/apk/* && \
    asdf global erlang "$ASDF_ERLANG_VERSION" && \
    asdf global elixir "$ELIXIR_VERSION" && \
    mix local.hex --force && \
    mix local.rebar --force
