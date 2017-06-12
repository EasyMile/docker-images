FROM easymile/elixir:1.4.4

MAINTAINER frederic.cabestre [at] easymile.com

ADD entrypoint.sh /entrypoint.sh

WORKDIR /build

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --no-cache --update \
    nodejs \
    nodejs-npm \
    protobuf \
    su-exec \
    # Required to build `flow`
    alpine-sdk \
    diffutils \
    elfutils-dev \
    elfutils-libelf \
    linux-headers \
    ncurses \
    ocaml \
    ocamlbuild \
    # Required to build `node-sass`
    python2 && \
    npm install -g yarn && \
    # Build flow
    git clone --depth 1 --branch v0.44.1 https://github.com/facebook/flow.git && \
    cd flow && \
    make && \
    cp bin/flow /usr/bin/flow && \
    rm -rf flow && \
    cd .. && \
    apk del --no-cache alpine-sdk diffutils elfutils-dev ncurses ocaml ocamlbuild && \

    asdf local erlang "$ERLANG_VERSION" && \
    asdf local elixir "$ELIXIR_VERSION" && \
    mix local.hex --force && \
    mix local.rebar --force && \

    git clone https://github.com/jeremyjh/dialyxir && \
    cd dialyxir && \
    MIX_ENV=prod mix do compile, archive.build, archive.install --force && \
    cd .. && \
    mix dialyzer && \
    rm -rf dialyxir && \
    rm -rf /usr/local/asdf/installs/elixir/"$ELIXIR_VERSION"/.mix/archives/$(mix archive | grep '* dialyxir' | cut -d ' ' -f 2)

WORKDIR /build/source

ENV USER=1000 GROUP=1000

ENTRYPOINT ["/entrypoint.sh"]
