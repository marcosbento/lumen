#!/usr/bin/env bash

set -e
set -x

BASE_INSTALL_DIR=/opt
CMAKE_INSTALL_DIR=${BASE_INSTALL_DIR}/cmake
CMAKE_ARCH=$(uname -m)
CMAKE_VERSION=4.0.2

CMAKE_BASENAME=cmake-${CMAKE_VERSION}-linux-${CMAKE_ARCH}
CMAKE_ARCHIVE=${CMAKE_BASENAME}.tar.gz

pushd ${BASE_INSTALL_DIR} 

wget --no-check-certificate https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/${CMAKE_ARCHIVE}
tar zxf ${CMAKE_ARCHIVE}
ln -s ${CMAKE_BASENAME} cmake
rm ${CMAKE_ARCHIVE}

ln -s /opt/cmake/bin/cmake /usr/bin/cmake
ln -s /opt/cmake/bin/ctest /usr/bin/ctest
ln -s /opt/cmake/bin/cpack /usr/bin/cpack

popd
