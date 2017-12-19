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
    protobuf=3.5.0-r1 \
    # Required to build `ShellCheck`
    ghc=8.0.2-r6 \
    cabal=1.24.0.2-r1 \
    && \
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
