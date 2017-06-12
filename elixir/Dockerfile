FROM easymile/erlang:19.3

MAINTAINER frederic.cabestre [at] easymile.com

ENV ELIXIR_VERSION 1.4.4

WORKDIR /usr/local

RUN asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git && \
    asdf install elixir "$ELIXIR_VERSION"
