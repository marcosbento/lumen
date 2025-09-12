FROM --platform=linux/amd64 archlinux:base-20250907.0.417472

RUN pacman -Sy --noconfirm \
        vim \
        clang \
        gcc \
        cmake \
        ninja \
        git \
        boost \
        boost-libs \
        qt6-base \
        qt6-svg \
        qt6-5compat \
        qt6-charts \
        python3 \
        sudo \
    && pacman -Sc --noconfirm

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