FROM --platform=linux/amd64 archlinux/archlinux:base-20260621.0.546891

RUN pacman -Suy --noconfirm \
        vim \
        clang \
        gcc \
        cmake \
        ninja \
        make \
        git \
        openssl \
        zlib \
        boost \
        boost-libs \
        qt6-base \
        qt6-svg \
        qt6-5compat \
        qt6-charts \
        python3 \
        python-pytest \
        which \
        sudo \
        wget \
        inetutils \
    && pacman -Sc --noconfirm

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