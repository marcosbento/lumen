#!/usr/bin/env bash

set -e
set -x

# Download and install latest CMake 
CMAKE_VERSION=4.2.1
CMAKE_ARCH=$(uname -m)
CMAKE_OS=$(uname -s | tr '[:upper:]' '[:lower:]')
CMAKE_TARBALL=cmake-${CMAKE_VERSION}-${CMAKE_OS}-${CMAKE_ARCH}.tar.gz
CMAKE_URL=https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/${CMAKE_TARBALL}

# Download CMake
curl -SL ${CMAKE_URL} -o /tmp/${CMAKE_TARBALL}
# Extract CMake
mkdir -p /opt/cmake
tar -xzf /tmp/${CMAKE_TARBALL} -C /opt/cmake --strip-components=1
/opt/cmake/bin/cmake --version
# Clean up
rm /tmp/${CMAKE_TARBALL}
