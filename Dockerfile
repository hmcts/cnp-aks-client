FROM microsoft/azure-cli:2.0.61

RUN apk update --no-cache \
  && apk add --no-cache gettext \
  && wget https://storage.googleapis.com/kubernetes-release/release/v1.16.2/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
  && wget https://get.helm.sh/helm-v2.16.1-linux-amd64.tar.gz -O - | tar xz \
  && mv /linux-amd64/helm /usr/local/bin/helm \
  && rm -rf /linux-amd64 \
  && chmod +x /usr/local/bin/kubectl \
  && addgroup -S -g 1001 jenkins \
  && adduser -S -D -G jenkins -u 1001 jenkins \
  && mkdir -p /opt/jenkins \
  && chown jenkins:jenkins /opt/jenkins
