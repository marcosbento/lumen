FROM almalinux:8.10-20260902

RUN dnf install -y --setopt=install_weak_deps=False 'dnf-command(config-manager)' \
        && \
    dnf config-manager --set-enabled powertools \
        && \
    dnf install -y --setopt=install_weak_deps=False epel-release \
        && \
    dnf update -y \
        && \
    dnf install -y --setopt=install_weak_deps=False \
        vim \
        file \
        sudo \
        rpm-build \
        curl \
        wget \
        git \
        gcc \
        gcc-c++ \
        clang \
        compiler-rt \
        gdb \
        cmake3 \
        make \
        openssl-devel \
        zlib-devel \
        libxcrypt-devel \
        python3.12 \
        python3.12-devel \
        python3.12-pip \
        python3.12-pytest \
        qt5-qtbase-devel \
        qt5-qtbase-gui \
        qt5-qtsvg-devel \
        qt5-qtcharts-devel \
        boost-devel \
        boost-static \
        && \
    dnf clean all

# Install latest CMake at /opt/cmake
# (distro CMake is kept on purpose, as the Qt devel packages require it)
COPY scripts/install_cmake.sh /tmp/install_cmake.sh
RUN chmod +x /tmp/install_cmake.sh && \
    /tmp/install_cmake.sh && \
    rm /tmp/install_cmake.sh
ENV PATH="/opt/cmake/bin:${PATH}"

# Install latest Ninja at /usr/local (the distro version is too old for CMake 4)
COPY scripts/install_ninja.sh /tmp/install_ninja.sh
RUN chmod +x /tmp/install_ninja.sh && \
    /tmp/install_ninja.sh && \
    rm /tmp/install_ninja.sh

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