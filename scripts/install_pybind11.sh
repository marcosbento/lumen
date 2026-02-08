#!/usr/bin/env bash

set -e
set -x

# Download and install latest pybind11
PYBIND11_VERSION=3.0.1
PYBIND11_GITHUB_URL=https://github.com/pybind/pybind11.git

# Download pybind11, using git clone to get the full repository and avoid issues with tarball downloads
git clone --branch v${PYBIND11_VERSION} --depth 1 ${PYBIND11_GITHUB_URL} /tmp/pybind11-${PYBIND11_VERSION}

## Build and install pybind11
pushd /tmp/pybind11-${PYBIND11_VERSION}
cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF
cmake --build build --target all -- -j$(nproc)
cmake --build build --target install
popd

# Clean up
rm -rf /tmp/pybind11-${PYBIND11_VERSION}