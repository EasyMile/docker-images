FROM easymile/elixir:1.5.0

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
    python2 \
    # Required to build `ShellCheck`
    ghc \
    cabal && \

    sudo npm install -g yarn && \
    # Build flow
    git clone --depth 1 --branch v0.44.1 https://github.com/facebook/flow.git && \
    cd flow && \
    make && \
    sudo cp bin/flow /usr/bin/flow && \
    cd .. && \
    rm -rf flow && \

    # Build ShellCheck
    cabal update && \
    cabal install ShellCheck && \
    sudo cp .cabal/bin/shellcheck /usr/bin/shellcheck && \
    rm -rf .cabal/bin/shellcheck && \

    sudo chown builder. -R /usr/local/asdf && \
    sudo apk del --no-cache alpine-sdk diffutils elfutils-dev ncurses ocaml ocamlbuild cabal ghc && \
    asdf global erlang "$ERLANG_VERSION" && \
    asdf global elixir "$ELIXIR_VERSION" && \
    mix local.hex --force && \
    mix local.rebar --force
