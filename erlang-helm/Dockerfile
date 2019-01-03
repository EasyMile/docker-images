FROM easymile/erlang-runtime-base:1.9

ADD https://kubernetes-helm.storage.googleapis.com/helm-v2.11.0-linux-amd64.tar.gz /helm

RUN tar xvzf /helm && \
  cp /linux-amd64/helm /usr/bin/helm && \
  chmod +x /usr/bin/* && \
  # LIBFFI and OPENSSL for pki.py, to remove once elixir-ed
  apk --update add python3=3.6.6-r0 python3-dev=3.6.6-r0 musl-dev=1.1.19-r10 libffi-dev=3.2.1-r4 openssl-dev=1.0.2q-r0 gcc=6.4.0-r9 && \
  python3 -m ensurepip && \
  rm -r /usr/lib/python*/ensurepip && \
  pip3 install --upgrade pip setuptools && \
  rm -rf /var/cache/apk/*
