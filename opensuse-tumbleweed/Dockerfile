FROM opensuse/tumbleweed:latest

RUN zypper refresh \
    && zypper update -y \
    && zypper install -y \
        vim \
        file \
        clang \
        gdb \
        gcc \
        ninja \
        make \
        git \
        libboost_date_time-devel \
        libboost_process-devel \
        libboost_program_options-devel \
        libboost_test-devel \
        zlib-devel \
        libxcrypt-devel \
        python3-devel \
        python3-pytest \
        openssl-devel \
        qt6-base-devel qt6-svg-devel qt6-qt5compat-devel \
        wget \
        curl \
        tar \
        sudo \
        iputils \
    && zypper clean -a

# Install latest CMake at /opt/cmake
# (distro CMake is kept on purpose, as the Qt devel packages require it)
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
