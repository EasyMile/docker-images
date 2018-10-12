FROM easymile/erlang:21.1

MAINTAINER frederic.cabestre [at] easymile.com

ENV ELIXIR_VERSION 1.7.3

WORKDIR /usr/local

RUN asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git && \
    asdf install elixir "$ELIXIR_VERSION"
