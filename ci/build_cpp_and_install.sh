#!/usr/bin/env bash
set -euo pipefail

QT_PREFIX_PATH="${QT_PREFIX_PATH:-}"
if [ -z "${QT_PREFIX_PATH}" ]; then
  echo "QT_PREFIX_PATH is not set"
  exit 1
fi

cmake -S . -B _cmake_build \
  -DCMAKE_BUILD_TYPE=Release \
  -DSEQEYES_BUILD_TESTS=OFF \
  -DCMAKE_PREFIX_PATH="${QT_PREFIX_PATH}" \
  -DCMAKE_INSTALL_PREFIX="${PWD}/python"

cmake --build _cmake_build --config Release
cmake --install _cmake_build --config Release
