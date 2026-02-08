FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install development packages

RUN apt-get update -y \
      && apt-get install -y --no-install-recommends \
            software-properties-common \
            sudo \
            ca-certificates \
            vim \
            wget \
            curl \
            iputils-ping \
            \
            build-essential \
            git \
            gcc g++ gfortran \
            gcc-9 g++9 gfortran-9 \
            gcc-10 g++10 gfortran-10 \
            gcc-11 g++-11 gfortran-11 \
            gcc-12 g++-12 gfortran-12 \
            gcc-13 g++-13 gfortran-13 \
            gcc-14 g++-14 gfortran-14 \
            clang clang-tidy \
            clang-14 clang-tidy-14 \
            clang-15 clang-tidy-15 \
            clang-16 clang-tidy-16 \
            clang-17 clang-tidy-17 \
            clang-18 clang-tidy-18 \
            clang-19 clang-tidy-19 \
            clang-20 clang-tidy-20 \
            ninja-build \
            gdb \
            bison flex \
            libssl-dev \
            python3 python3-dev python3-pip python3-sphinx \
            qt6-base-dev qt6-svg-dev qt6-5compat-dev \
            libboost-dev libboost-system-dev libboost-timer-dev libboost-chrono-dev libboost-filesystem-dev \
            libboost-program-options-dev libboost-python-dev libboost-date-time-dev libboost-test-dev \
            unzip \
            tini \
      && rm -rf /var/lib/apt/lists/*

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
ARG UID=1001
RUN useradd -m -s /bin/bash -u $UID $USER && \
    echo "devuser ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER && \
    chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR /home/$USER

CMD ["/bin/bash"]

