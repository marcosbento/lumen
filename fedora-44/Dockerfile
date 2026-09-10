FROM fedora:44

RUN dnf update -y \
        && \
    dnf install -y \
        @development-tools \
        vim \
        sudo \
        rpm-build \
        wget \
        curl \
        iputils \
        \
        git \
        gcc \
        gcc-c++ \
        clang \
        ninja-build \
        make \
        openssl-devel \
        zlib-devel \
        libxcrypt-devel \
        python3 \
        python3-devel \
        python3-pip \
        python3-pytest \
        qt5-qtbase-devel \
        qt5-qtbase-gui \
        qt5-qtsvg-devel \
        boost-devel \
        boost-static \
    && dnf clean all

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
    echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chmod 0440 /etc/sudoers

USER $USER
WORKDIR /home/$USER

CMD ["/bin/bash"]