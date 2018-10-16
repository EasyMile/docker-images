# erlang-runtime-base

Based on alpine, contains:
* ca-certificates
* libcrypto1.0
* ncurses-libs

mandatory for elixir runtime to work

Added specific commands for our use cases (ENTRYPOINT ["/release/bin/boot"] by default, ...)
