FROM rockylinux/rockylinux:8.10.20240528

RUN dnf groupinstall -y "Development Tools" \
        && \
    dnf config-manager --set-enabled powertools \
        && \
    dnf install -y \
        epel-release \
        && \
    dnf update -y \
        && \
    dnf install -y \
        vim \
        sudo \
        rpm-build \
        curl \
        wget \
        git \
        gcc \
        gcc-c++ \
        gcc-gfortran \
        clang \
        cmake3 \
        ninja-build \
        make \
        fftw-devel \
        bison \
        flex \
        perl \
        openssl-devel \
        libaec-devel \
        libpng-devel \
        eigen3-devel \
        lapack-devel \
        proj \
        proj-devel \
        netcdf-devel \
        python3.12 \
        python3.12-devel \
        python3.12-pip \
        python3.12-pybind11-devel \
        ncurses-devel \
        libtirpc \
        libtirpc-devel \
        postgresql-libs \
        postgresql-devel \
        qt5-devel \
        qt5-qtbase-devel \
        qt5-qtbase-gui \
        qt5-qtsvg-devel \
        qt5-qtxmlpatterns-devel \
        expat-devel \
        libcurl-devel \
        gdbm-devel \
        openjpeg2-devel \
        uuid-devel \
        boost-devel \
        boost-static \
        boost-python3-devel \
        rpcgen \
    && dnf clean all

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
    echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chmod 0440 /etc/sudoers

USER $USER
WORKDIR /home/$USER

CMD ["/bin/bash"]