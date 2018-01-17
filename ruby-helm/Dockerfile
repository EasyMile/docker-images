FROM ruby:2.5.0-stretch

ADD https://kubernetes-helm.storage.googleapis.com/helm-v2.7.2-linux-amd64.tar.gz /helm

RUN tar xvzf /helm && cp /linux-amd64/helm /usr/bin/helm && chmod +x /usr/bin/helm
