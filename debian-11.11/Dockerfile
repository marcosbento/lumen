FROM debian:11.11-slim

ARG DEBIAN_FRONTEND=noninteractive

# Bullseye LTS has ended, and its live security index references packages that are no longer available.
# Use the final pre-EOL snapshot to keep package installation reproducible.
RUN printf '%s\n' \
        'deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20260824T000000Z bullseye main' \
        'deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20260824T000000Z bullseye-security main' \
        'deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20260824T000000Z bullseye-updates main' \
        > /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        vim \
        file \
        procps \
        sudo \
        wget \
        curl \
        iputils-ping \
        \
        build-essential \
        git \
        gcc \
        g++ \
        clang \
        clang-format \
        gdb \
        ninja-build \
        libssl-dev \
        zlib1g-dev \
        libcrypt-dev \
        python3 \
        python3-dev \
        python3-pip \
        python3-pytest \
        python3-sphinx \
        qtbase5-dev \
        libqt5svg5-dev \
        libqt5charts5-dev \
        libboost-dev \
        libboost-system-dev \
        libboost-timer-dev \
        libboost-chrono-dev \
        libboost-program-options-dev \
        libboost-date-time-dev \
        libboost-test-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install latest CMake at /opt/cmake
COPY scripts/install_cmake.sh /tmp/install_cmake.sh
RUN chmod +x /tmp/install_cmake.sh && \
    /tmp/install_cmake.sh && \
    rm /tmp/install_cmake.sh
ENV PATH="/opt/cmake/bin:${PATH}"

# Install pybind11
COPY scripts/install_pybind11.sh /tmp/install_pybind11.sh
RUN chmod +x /tmp/install_pybind11.sh && \
    /tmp/install_pybind11.sh && \
    rm /tmp/install_pybind11.sh

# Set up a non-root user
ARG USER=devuser
ARG UID=1000
RUN useradd -m -s /bin/bash -u $UID $USER && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER && \
    chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR /home/$USER

CMD ["/bin/bash"]