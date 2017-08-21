FROM easymile/erlang:20.0_1

MAINTAINER frederic.cabestre [at] easymile.com

ENV ELIXIR_VERSION 1.5.0

WORKDIR /usr/local

RUN asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git && \
    asdf install elixir "$ELIXIR_VERSION"
