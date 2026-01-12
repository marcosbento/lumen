#!/usr/bin/env bash

set -e
set -x

# Download and install latest CMake 
CMAKE_VERSION=4.2.1
CMAKE_ARCH=$(uname -m)
CMAKE_OS=$(uname -s | tr '[:upper:]' '[:lower:]')
CMAKE_PACKAGE=cmake-${CMAKE_VERSION}-${CMAKE_OS}-${CMAKE_ARCH}.tar.gz
CMAKE_SHA=cmake-${CMAKE_VERSION}-SHA-256.txt
CMAKE_PACKAGE_URL=https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/${CMAKE_PACKAGE}
CMAKE_SHA_URL=https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/${CMAKE_SHA}

# Download CMake
wget ${CMAKE_PACKAGE_URL} -O /tmp/${CMAKE_PACKAGE}
# Download CMake SHA256 checksum
wget ${CMAKE_SHA_URL} -O /tmp/${CMAKE_SHA}

# Extract CMake
mkdir -p /opt/cmake
tar -xzf /tmp/${CMAKE_PACKAGE} -C /opt/cmake --strip-components=1
/opt/cmake/bin/cmake --version
# Clean up
rm /tmp/${CMAKE_PACKAGE}
rm /tmp/${CMAKE_SHA}