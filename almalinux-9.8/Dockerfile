FROM almalinux:9.8-20260602

RUN dnf groupinstall -y "Development Tools" \
        && \
    dnf install -y 'dnf-command(config-manager)' \
        && \
    dnf config-manager --set-enabled crb \
        && \
    dnf install -y epel-release \
        && \
    dnf update -y \
        && \
    dnf install -y \
        vim \
        sudo \
        rpm-build \
        wget \
        git \
        gcc \
        gcc-c++ \
        clang \
        cmake \
        ninja-build \
        make \
        openssl-devel \
        zlib-devel \
        libxcrypt-devel \
        python3 \
        python3-devel \
        python3-pip \
        python3-pytest \
        qt5-devel \
        qt5-qtbase-devel \
        qt5-qtbase-gui \
        qt5-qtsvg-devel \
        boost-devel \
        boost-static \
        && \
    dnf clean all

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