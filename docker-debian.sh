#!/usr/bin/env bash
export NODE_VERSION="12"
export NODE_RED_VERSION="2.0.6"

echo "#########################################################################"
echo "node-js version: ${NODE_VERSION}"
echo "node-red version: ${NODE_RED_VERSION}"
echo "#########################################################################"

docker build --rm  \
    --build-arg ARCH=amd64 \
    --build-arg NODE_VERSION=${NODE_VERSION} \
    --build-arg NODE_RED_VERSION=${NODE_RED_VERSION} \
    --build-arg OS=minideb \
    --build-arg BUILD_DATE="$(date +"%Y-%m-%dT%H:%M:%SZ")" \
    --build-arg TAG_SUFFIX=default \
    --file Dockerfile.debian \
    --target RELEASE \
    --tag node-red-minideb:${NODE_VERSION}-v${NODE_RED_VERSION} .
