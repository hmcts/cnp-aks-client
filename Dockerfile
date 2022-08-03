FROM mcr.microsoft.com/azure-cli:2.39.0

RUN apk update --no-cache \
  && apk add --no-cache gettext rsync \
  && wget https://github.com/fluxcd/flux2/releases/download/v0.30.2/flux_0.30.2_linux_amd64.tar.gz -O -  | tar xz \
  && mv flux /usr/local/bin/flux \
  && wget https://dl.k8s.io/release/v1.20.5/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
  && wget https://get.helm.sh/helm-v3.5.3-linux-amd64.tar.gz -O - | tar xz \
  && mv /linux-amd64/helm /usr/local/bin/helm \
  && rm -rf /linux-amd64 \
  && chmod +x /usr/local/bin/kubectl \
  && addgroup -S -g 1001 jenkins \
  && adduser -S -D -G jenkins -u 1001 jenkins \
  && mkdir -p /opt/jenkins \
  && chown jenkins:jenkins /opt/jenkins

