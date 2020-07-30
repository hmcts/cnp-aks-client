FROM mcr.microsoft.com/azure-cli:2.3.0

RUN apk update --no-cache \
  && apk add --no-cache gettext rsync \
  && wget https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
  && wget https://get.helm.sh/helm-v3.1.2-linux-amd64.tar.gz -O - | tar xz \
  && mv /linux-amd64/helm /usr/local/bin/helm \
  && rm -rf /linux-amd64 \
  && chmod +x /usr/local/bin/kubectl \
  && addgroup -S -g 1001 jenkins \
  && adduser -S -D -G jenkins -u 1001 jenkins \
  && mkdir -p /opt/jenkins \
  && chown jenkins:jenkins /opt/jenkins
