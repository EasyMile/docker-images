FROM easymile/elixir:1.5.2_1

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
    jq=1.5-r3 \
    protobuf=3.3.2-r1 \
    # Required to install yarn
    nodejs=8.9.0-r0 \
    nodejs-npm=8.9.0-r0 \
    # Required to build `flow`
    alpine-sdk=0.5-r0 \
    diffutils=3.6-r0 \
    elfutils-dev=0.168-r1 \
    elfutils-libelf=0.168-r1 \
    linux-headers=4.4.6-r2 \
    ncurses=6.0_p20170930-r0 \
    ocaml=4.04.2-r1 \
    opam=1.2.2-r1 \
    m4=1.4.18-r0 \
    # Required to build `node-sass`
    python2=2.7.13-r1 \
    # Required to build `ShellCheck`
    ghc=8.0.2-r6 \
    cabal=1.24.0.2-r1 \

    && \

    # Install yarn
    sudo npm install -g yarn@1.2.1 && \

    # Build flow
    opam init && \
    opam install -y ocamlbuild ocamlfind sedlex && \
    export PATH=$PATH:~/.opam/system/bin && \
    git clone --depth 1 --branch v0.58.0 https://github.com/facebook/flow.git && \
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
    sudo apk del --no-cache alpine-sdk diffutils elfutils-dev ncurses opam ocaml cabal ghc && \
    sudo rm -rf /var/cache/apk/* && \
    asdf global erlang "$ASDF_ERLANG_VERSION" && \
    asdf global elixir "$ELIXIR_VERSION" && \
    mix local.hex --force && \
    mix local.rebar --force
