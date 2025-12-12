FROM debian:11.11

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        vim \
        sudo \
        wget \
        curl \
        \
        build-essential \
        git \
        gcc \
        g++ \
        gfortran \
        clang \
        clang-format \
        cmake \
        ninja-build \
        libfftw3-dev \
        bison \
        flex \
        libssl-dev \
        libaec-dev \
        libpng-dev \
        libeigen3-dev \
        liblapack-dev \
        libncurses5-dev \
        libnetcdf-dev \
        libnetcdff-dev \
        libblas-dev \
        libpq-dev \
        python3 \
        python3-dev \
        python3-pip \
        python3-sphinx \
        wget \
        perl \
        qtbase5-dev \
        libqt5svg5-dev \
        libqt5xmlpatterns5-dev \
        libboost-dev \
        libboost-system-dev \
        libboost-timer-dev \
        libboost-chrono-dev \
        libboost-filesystem-dev \
        libboost-program-options-dev \
        libboost-python-dev \
        libboost-date-time-dev \
        libboost-test-dev \
        proj-bin \
        libproj-dev \
        libexpat1-dev \
        libgdbm-dev \
        libtirpc-dev \
        unzip \
        libopenjp2-7-dev \
        uuid-dev \
        pybind11-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install latest CMake at /opt/cmake
COPY scripts/install_cmake.sh /tmp/install_cmake.sh
RUN chmod +x /tmp/install_cmake.sh && \
    /tmp/install_cmake.sh && \
    rm /tmp/install_cmake.sh
ENV PATH="/opt/cmake/bin:${PATH}"

# Set up a non-root user
ARG USER=devuser
ARG UID=1000
RUN useradd -m -s /bin/bash -u $UID $USER && \
    echo "devuser ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER && \
    chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR /home/$USER

CMD ["/bin/bash"]