FROM mcr.microsoft.com/azure-cli:2.21.0

RUN apk update --no-cache \
  && apk add --no-cache gettext rsync \
  && wget https://dl.k8s.io/release/v1.20.5/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
  && wget https://get.helm.sh/helm-v3.5.3-linux-amd64.tar.gz -O - | tar xz \
  && mv /linux-amd64/helm /usr/local/bin/helm \
  && rm -rf /linux-amd64 \
  && chmod +x /usr/local/bin/kubectl \
  && addgroup -S -g 1001 jenkins \
  && adduser -S -D -G jenkins -u 1001 jenkins \
  && mkdir -p /opt/jenkins \
  && chown jenkins:jenkins /opt/jenkins \
# TODO remove hotfix after mitigated / patched by Azure, see https://github.com/Azure/azure-cli/pull/17509
  && curl https://raw.githubusercontent.com/Azure/azure-cli/fix-managed_by_tenants/src/azure-cli-core/azure/cli/core/_profile.py --output /usr/local/lib/python3.6/site-packages/azure/cli/core/_profile.py


