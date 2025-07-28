#!/bin/bash

# Set default values
DD_API_KEY=${DD_API_KEY:-""}
DD_SITE=${DD_SITE:-"datadoghq.com"}
DD_SERVICE=${DD_SERVICE:-"flowise-langchain"}
DD_ENV=${DD_ENV:-"production"}
DD_VERSION=${DD_VERSION:-"1.0.0"}
IMAGE_NAME=${IMAGE_NAME:-"flowise-datadog"}
IMAGE_TAG=${IMAGE_TAG:-"latest"}

echo "Building ${IMAGE_NAME}:${IMAGE_TAG} with Datadog configuration..."

docker build \
  --build-arg DD_API_KEY="$DD_API_KEY" \
  --build-arg DD_SITE="$DD_SITE" \
  --build-arg DD_SERVICE="$DD_SERVICE" \
  --build-arg DD_ENV="$DD_ENV" \
  --build-arg DD_VERSION="$DD_VERSION" \
  -t "${IMAGE_NAME}:${IMAGE_TAG}" .

echo "Build complete! Run with:"
echo "docker run -d -p 3000:3000 ${IMAGE_NAME}:${IMAGE_TAG}" 