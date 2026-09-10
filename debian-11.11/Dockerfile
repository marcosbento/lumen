FROM debian:11.11

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        vim \
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
        cmake \
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