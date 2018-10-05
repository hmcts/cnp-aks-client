FROM microsoft/azure-cli:2.0.46

RUN apk update --no-cache \
  && apk add --no-cache gettext \
  && wget https://storage.googleapis.com/kubernetes-release/release/v1.11.3/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl \
  && addgroup -S -g 1001 jenkins \
  && adduser -S -D -H -G jenkins -u 1001 jenkins \
  && mkdir -p /opt/jenkins \
  && chown jenkins:jenkins /opt/jenkins
