#!/usr/bin/env bash

set -e
set -x

# Download and install latest libaec
LIBAEC_VERSION=1.1.6
LIBAEC_REPO_URL=https://gitlab.dkrz.de/dkrz-sw/libaec.git

# Download libaec, using git clone to get the full repository and avoid issues with tarball downloads
git clone --branch v${LIBAEC_VERSION} --depth 1 ${LIBAEC_REPO_URL} /tmp/libaec-${LIBAEC_VERSION}

## Build and install libaec
pushd /tmp/libaec-${LIBAEC_VERSION}
cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -DBUILD_STATIC_LIBS=OFF -DBUILD_TESTING=OFF
cmake --build build --target all -- -j$(nproc)
cmake --build build --target install
popd

# Clean up
rm -rf /tmp/libaec-${LIBAEC_VERSION}