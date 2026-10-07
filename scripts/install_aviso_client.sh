#!/usr/bin/env bash

set -e
set -x

# Download and install latest aviso-client
AVISO_CLIENT_VERSION=2.4.2
AVISO_CLIENT_GITHUB_URL=https://github.com/ecmwf/aviso-client.git

# Keep the Rust toolchain, tools, caches and build artifacts temporary
AVISO_CLIENT_BUILD_DIR=$(mktemp -d /tmp/aviso-client.XXXXXX)
trap 'rm -rf "${AVISO_CLIENT_BUILD_DIR}"' EXIT
export CARGO_HOME=${AVISO_CLIENT_BUILD_DIR}/cargo
export RUSTUP_HOME=${AVISO_CLIENT_BUILD_DIR}/rustup
export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=${AVISO_CLIENT_BUILD_DIR}/target
export TMPDIR=${AVISO_CLIENT_BUILD_DIR}/tmp
mkdir -p "${TMPDIR}"

# Install a minimal Rust toolchain without changing the user's shell configuration
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o ${AVISO_CLIENT_BUILD_DIR}/rustup-init.sh
sh ${AVISO_CLIENT_BUILD_DIR}/rustup-init.sh -y --profile minimal --default-toolchain stable --no-modify-path
export PATH="${CARGO_HOME}/bin:${PATH}"

# Download aviso-client, using git clone to get the full repository and avoid issues with tarball downloads
git clone --branch ${AVISO_CLIENT_VERSION} --depth 1 ${AVISO_CLIENT_GITHUB_URL} ${AVISO_CLIENT_BUILD_DIR}/source

## Build and install aviso-client
cargo install cargo-c --locked
pushd ${AVISO_CLIENT_BUILD_DIR}/source
cargo cinstall --locked -p aviso-ffi --release --prefix=/usr/local --libdir=/usr/local/lib
popd

# Clean up (the exit trap also handles failed builds)
rm -rf "${AVISO_CLIENT_BUILD_DIR}"
