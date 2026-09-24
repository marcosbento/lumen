#!/usr/bin/env bash

set -e
set -x

# Download and install latest Ninja
NINJA_VERSION=1.13.2
NINJA_GITHUB_URL=https://github.com/ninja-build/ninja.git

# Download Ninja, using git clone to get the full repository and avoid issues with tarball downloads
git clone --branch v${NINJA_VERSION} --depth 1 ${NINJA_GITHUB_URL} /tmp/ninja-${NINJA_VERSION}

## Build and install Ninja
pushd /tmp/ninja-${NINJA_VERSION}
cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF
cmake --build build --target all -- -j$(nproc)
cmake --build build --target install
popd
ninja --version

# Clean up
rm -rf /tmp/ninja-${NINJA_VERSION}
