FROM easymile/erlang-runtime-base:1.6

ADD https://github.com/kubernetes/kops/releases/download/1.8.0/kops-linux-amd64 /usr/bin/kops
ADD https://dl.k8s.io/v1.8.5/kubernetes-client-linux-386.tar.gz /tmp/kubernetes-client-linux.tar.gz
ADD https://kubernetes-helm.storage.googleapis.com/helm-v2.7.2-linux-amd64.tar.gz /helm

RUN tar xvzf /helm && \
  tar xvzf /tmp/kubernetes-client-linux.tar.gz && \
  mv /kubernetes/client/bin/* /usr/bin && \
  cp /linux-amd64/helm /usr/bin/helm && \
  chmod +x /usr/bin/* && \
  # LIBFFI and OPENSSL for pki.py, to remove once elixir-ed
  apk --update add python3=3.6.1-r3 python3-dev=3.6.1-r3 musl-dev=1.1.16-r14 libffi-dev=3.2.1-r3 openssl-dev=1.0.2n-r0 gcc=6.3.0-r4 && \
  python3 -m ensurepip && \
  rm -r /usr/lib/python*/ensurepip && \
  pip3 install --upgrade pip setuptools && \
  rm -rf /var/cache/apk/*

