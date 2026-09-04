FROM debian:13.5

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
        gfortran \
        clang \
        clang-format \
        cmake \
        ninja-build \
        libfftw3-dev \
        bison \
        flex \
        libssl-dev \
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
        python3-pytest \
        python3-sphinx \
        wget \
        perl \
        qt6-base-dev \
        qt6-svg-dev \
        qt6-charts-dev \
        qt6-5compat-dev \
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

# Install libaec
COPY scripts/install_libaec.sh /tmp/install_libaec.sh
RUN chmod +x /tmp/install_libaec.sh && \
    /tmp/install_libaec.sh && \
    rm /tmp/install_libaec.sh
 
# Set up a non-root user
ARG USER=devuser
ARG UID=1000
RUN useradd -m -s /bin/bash -u $UID $USER && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER && \
    chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR /home/$USER

CMD ["/bin/bash"]