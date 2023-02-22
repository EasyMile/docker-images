FROM erlang:25.2.2.0-alpine

MAINTAINER frederic.cabestre [at] easymile.com

ENV ELIXIR_VERSION 1.14.3

ENV PATH="/usr/local/asdf/bin:/usr/local/asdf/shims:$PATH"

WORKDIR /usr/local

RUN apk add --no-cache --update \
    git \
    bash \
    curl \
    make=4.3-r0 \
    unzip

RUN   git clone https://github.com/asdf-vm/asdf.git /usr/local/asdf --branch v0.2.0 && \
    asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git && \
    asdf install elixir "$ELIXIR_VERSION"

# Elixir

RUN addgroup builder -g 1000 && \
    adduser builder -u 1000 -s /bin/ash -SDG builder && \
    apk add --update sudo && \
    echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER builder
WORKDIR /home/builder

RUN sudo apk add --no-cache --update \
    jq=1.6-r1	 \
    protobuf=3.18.1-r3 && \
    sudo chown builder. -R /usr/local/asdf && \
    sudo rm -rf /var/cache/apk/* && \
    asdf global elixir "$ELIXIR_VERSION" && \
    mix local.hex --force && \
    mix local.rebar --force
