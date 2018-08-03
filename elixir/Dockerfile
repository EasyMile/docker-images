FROM easymile/erlang:21.0.4

MAINTAINER frederic.cabestre [at] easymile.com

ENV ELIXIR_VERSION 1.7.1

WORKDIR /usr/local

RUN asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git && \
    asdf install elixir "$ELIXIR_VERSION"
