#!/usr/bin/env bash
set -euo pipefail

QT_VERSION="${QT_VERSION:-6.5.3}"
QT_ARCH="${QT_ARCH:-gcc_64}"
QT_ROOT="${QT_ROOT:-/opt/Qt}"

python -m pip install --upgrade pip
python -m pip install aqtinstall

python -m aqt install-qt linux desktop "${QT_VERSION}" "${QT_ARCH}" -O "${QT_ROOT}"

QT_PREFIX_PATH="${QT_ROOT}/${QT_VERSION}/${QT_ARCH}"
if [ ! -d "${QT_PREFIX_PATH}" ]; then
  echo "Qt not found at ${QT_PREFIX_PATH}"
  exit 1
fi

echo "QT_PREFIX_PATH=${QT_PREFIX_PATH}" >> "${GITHUB_ENV:-/dev/null}" || true
export PATH="${QT_PREFIX_PATH}/bin:${PATH}"
export LD_LIBRARY_PATH="${QT_PREFIX_PATH}/lib:${LD_LIBRARY_PATH:-}"
