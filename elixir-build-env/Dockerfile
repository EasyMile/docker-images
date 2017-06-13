FROM easymile/elixir:1.4.4

MAINTAINER frederic.cabestre [at] easymile.com

RUN addgroup builder -g 1000 && \
    adduser builder -u 1000 -s /bin/ash -SDG builder && \
    apk add --update sudo && \
    echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER builder
WORKDIR /home/builder

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" | sudo tee -a /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" | sudo tee -a /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" | sudo tee -a /etc/apk/repositories && \
    sudo apk add --no-cache --update \
    nodejs \
    nodejs-npm \
    protobuf \
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

    sudo npm install -g yarn && \
    # Build flow
    git clone --depth 1 --branch v0.44.1 https://github.com/facebook/flow.git && \
    cd flow && \
    make && \
    sudo cp bin/flow /usr/bin/flow && \
    rm -rf flow && \
    cd .. && \
    
    sudo chown builder. -R /usr/local/asdf && \
    sudo apk del --no-cache alpine-sdk diffutils elfutils-dev ncurses ocaml ocamlbuild && \
    asdf global erlang "$ERLANG_VERSION" && \
    asdf global elixir "$ELIXIR_VERSION" && \
    mix local.hex --force && \
    mix local.rebar --force && \

    git clone https://github.com/jeremyjh/dialyxir && \
    cd dialyxir && \
    MIX_ENV=prod mix do compile, archive.build, archive.install --force && \
    cd .. && \
    mix dialyzer && \
    rm -rf dialyxir && \
    rm -rf /usr/local/asdf/installs/elixir/"$ELIXIR_VERSION"/.mix/archives/$(mix archive | grep '* dialyxir' | cut -d ' ' -f 2)
