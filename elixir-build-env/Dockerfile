FROM alpine:3.9

MAINTAINER frederic.cabestre [at] easymile.com

ENV PATH="/usr/local/asdf/bin:/usr/local/asdf/shims:$PATH" \
    ASDF_ERLANG_VERSION=21.2.5

WORKDIR /usr/local

RUN apk add --no-cache --update \
    # Erlang Build dependencies, removed in the end
    autoconf=2.69-r2 \
    bash=4.4.19-r1 \
    curl=7.63.0-r0 \
    dpkg-dev=1.19.2-r0 \
    g++=8.2.0-r2 \
    gcc=8.2.0-r2 \
    git=2.20.1-r0 \
    libssh-dev=0.7.6-r1 \
    make=4.2.1-r2 \
    ncurses-dev=6.1_p20190105-r0 \
    openssl-dev=1.1.1a-r1 \

    # Runtime dependencies
    libcrypto1.1=1.1.1a-r1 \
    openssh-client=7.9_p1-r2 && \

    git clone https://github.com/asdf-vm/asdf.git /usr/local/asdf --branch v0.2.0 && \
    asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git && \
    asdf install erlang "$ASDF_ERLANG_VERSION" && \

    apk del --no-cache dpkg-dev autoconf libssh-dev openssl-dev ncurses-dev && \
    rm -rf /var/cache/apk/*

# Erlang

ENV ELIXIR_VERSION 1.8.1

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
    jq=1.6-r0	 \
    protobuf=3.6.1-r1 \
    # Required to build `ShellCheck`
    ghc=8.4.3-r0 \
    cabal=2.2.0.0-r0 \
    libffi=3.2.1-r6 && \
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
