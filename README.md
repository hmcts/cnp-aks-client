AKS Client
--
Docker image containing:
* Azure CLI
* kubectl

## Building
This is an automated build on Dockerhub.  To build a new version, ensure that you tag the image and use the tagged version in your build:

    git tag 1.0
    git push --tags