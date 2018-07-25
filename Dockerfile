FROM alpine

RUN apk update --no-cache \
  && apk add --no-cache make bash py-pip \
  && apk add --no-cache --virtual build-deps gcc libffi-dev musl-dev python2-dev openssl-dev \
  && pip install azure-cli \
  && apk del --purge build-deps \
  && wget https://storage.googleapis.com/kubernetes-release/release/v1.11.0/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/kubectl
