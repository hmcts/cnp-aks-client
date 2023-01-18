FROM mcr.microsoft.com/azure-cli:2.44.1

ENV FLUX_VERSION=0.38.3
ENV KUBECTL_VERSION=1.26.0
ENV HELM_VERSION=3.10.3

RUN apk update --no-cache \
  && apk add --no-cache gettext rsync ncurses \
  && wget https://github.com/fluxcd/flux2/releases/download/v${FLUX_VERSION}/flux_${FLUX_VERSION}_linux_amd64.tar.gz -O -  | tar xz \
  && mv flux /usr/local/bin/flux \
  && wget https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
  && wget https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz -O - | tar xz \
  && mv /linux-amd64/helm /usr/local/bin/helm \
  && rm -rf /linux-amd64 \
  && chmod +x /usr/local/bin/kubectl \
  && addgroup -S -g 1001 jenkins \
  && adduser -S -D -G jenkins -u 1001 jenkins \
  && mkdir -p /opt/jenkins \
  && chown jenkins:jenkins /opt/jenkins

