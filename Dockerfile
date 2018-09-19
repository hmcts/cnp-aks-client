FROM alpine:3.8

RUN apk update --no-cache \
  && apk add --no-cache make bash py-pip gettext jq \
  && apk add --no-cache --virtual build-deps gcc libffi-dev musl-dev python2-dev openssl-dev \
  && pip install future azure-cli \
  && apk del --purge build-deps \
  && wget https://storage.googleapis.com/kubernetes-release/release/v1.11.2/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl \
  && addgroup --gid 1001 jenkins \
  && adduser --uid 1001 -G jenkins --disabled-password --gecos "" jenkins \
  && mkdir -p /opt/jenkins \
  && chown jenkins:jenkins /opt/jenkins
