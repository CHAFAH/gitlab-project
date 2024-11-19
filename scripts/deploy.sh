#!/bin/bash

PLATFORM=$1
TARGET_DIR="/opt/deployments/$PLATFORM"

echo "Starting deployment for $PLATFORM..."

# Ensure target directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Creating target directory: $TARGET_DIR"
  mkdir -p "$TARGET_DIR"
fi

# Deploy build artifact
if [ -f "build/$PLATFORM/$PLATFORM-build-output" ]; then
  cp "build/$PLATFORM/$PLATFORM-build-output" "$TARGET_DIR/"
  echo "Build artifact deployed to $TARGET_DIR"
else
  echo "Error: Build artifact for $PLATFORM not found!"
  exit 1
fi

echo "Deployment completed successfully for $PLATFORM."
exit 0
