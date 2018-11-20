FROM microsoft/azure-cli:2.0.50

RUN apk update --no-cache \
  && apk add --no-cache gettext \
  && wget https://storage.googleapis.com/kubernetes-release/release/v1.12.2/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
  && wget https://storage.googleapis.com/kubernetes-helm/helm-v2.11.0-linux-amd64.tar.gz -O - | tar xz \
  && mv /linux-amd64/helm /usr/local/bin/helm \
  && mv /linux-amd64/tiller /usr/local/bin/tiller \
  && rm -rf /linux-amd64 \
  && chmod +x /usr/local/bin/kubectl \
  && addgroup -S -g 1001 jenkins \
  && adduser -S -D -G jenkins -u 1001 jenkins \
  && mkdir -p /opt/jenkins \
  && chown jenkins:jenkins /opt/jenkins
