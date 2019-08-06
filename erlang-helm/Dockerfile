FROM easymile/erlang-runtime-base:1.10

ADD https://kubernetes-helm.storage.googleapis.com/helm-v2.11.0-linux-amd64.tar.gz /helm

RUN tar xvzf /helm && \
  cp /linux-amd64/helm /usr/bin/helm && \
  chmod +x /usr/bin/* && \
  # LIBFFI and OPENSSL for pki.py, to remove once elixir-ed
  apk --update add \
    python3=3.6.8-r1 \
    python3-dev=3.6.8-r1 \
    musl-dev=1.1.20-r3 \
    libffi-dev=3.2.1-r6 \
    openssl-dev=1.1.1a-r1 \
    gcc=8.2.0-r2 && \
  python3 -m ensurepip && \
  rm -r /usr/lib/python*/ensurepip && \
  pip3 install --upgrade pip setuptools && \
  rm -rf /var/cache/apk/*
