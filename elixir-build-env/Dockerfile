FROM easymile/elixir:1.5.2

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
    nodejs=6.11.2-r0 \
    nodejs-npm=6.11.2-r0 \
    protobuf=3.3.2-r1 \
    # Required to build `flow`
    alpine-sdk=0.5-r0 \
    diffutils=3.6-r0 \
    elfutils-dev=0.168-r1 \
    elfutils-libelf=0.168-r1 \
    linux-headers=4.4.6-r2 \
    ncurses=6.0_p20170701-r0 \
    ocaml=4.04.2-r0 \
    ocamlbuild=0.9.3-r1 \
    # Required to build `node-sass`
    python2=2.7.13-r1 \
    # Required to build `ShellCheck`
    ghc=8.0.2-r6 \
    cabal=1.24.0.2-r1 && \

    sudo npm install -g yarn@0.27.5 && \
    # Build flow
    git clone --depth 1 --branch v0.44.1 https://github.com/facebook/flow.git && \
    cd flow && \
    make && \
    sudo cp bin/flow /usr/bin/flow && \
    cd .. && \
    rm -rf flow && \

    # Build ShellCheck
    cabal update && \
    cabal install ShellCheck-0.4.6 && \
    sudo cp .cabal/bin/shellcheck /usr/bin/shellcheck && \
    rm -rf .cabal/bin/shellcheck && \

    sudo chown builder. -R /usr/local/asdf && \
    sudo apk del --no-cache alpine-sdk diffutils elfutils-dev ncurses ocaml ocamlbuild cabal ghc && \
    sudo rm -rf /var/cache/apk/* && \
    asdf global erlang "$ERLANG_VERSION" && \
    asdf global elixir "$ELIXIR_VERSION" && \
    mix local.hex --force && \
    mix local.rebar --force
