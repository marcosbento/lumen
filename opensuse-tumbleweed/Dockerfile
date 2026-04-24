FROM opensuse/tumbleweed:latest

RUN zypper refresh \
    && zypper update -y \
    && zypper install -y \
        vim \
        clang \
        gcc \
        gcc-fortran \
        ninja \
        make \
        git \
        boost-devel libboost*-devel \
        zlib-devel \
        python3-devel \
        openssl-devel \
        qt6-base-devel qt6-svg-devel qt6-qt5compat-devel \
        wget \
        curl \
        tar \
        sudo \
        iputils \
    && zypper clean -a

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