#!/bin/bash
set -e  # выход при любой ошибке
set -o pipefail  # выход при ошибке в любой команде пайплайна

if ! docker image inspect tdlib:latest &>/dev/null; then
  echo "Building TDLib base image..."
  docker build -t tdlib:latest -f ./Dockerfile .
else
  echo "TDLib base image already exists, skipping build..."
fi
