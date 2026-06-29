FROM almalinux:10.2-20260602

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
        gcc-gfortran \
        clang \
        cmake \
        ninja-build \
        make \
        fftw-devel \
        bison \
        flex \
        perl \
        openssl-devel \
        libpng-devel \
        eigen3-devel \
        lapack-devel \
        proj \
        proj-devel \
        netcdf-devel \
        python3 \
        python3-devel \
        python3-pip \
        ncurses-devel \
        libtirpc \
        libtirpc-devel \
        postgresql-libs \
        postgresql-devel \
        qt6-qtbase-devel \
        qt6-qtbase-gui \
        qt6-qtsvg-devel \
        qt6-qtcharts-devel \
        qt6-qt5compat-devel \
        expat-devel \
        libcurl-devel \
        gdbm-devel \
        openjpeg2-devel \
        uuid-devel \
        boost-devel \
        boost-static \
        boost-python3-devel \
        rpcgen \
        && \
    dnf clean all

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
    echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chmod 0440 /etc/sudoers

USER $USER
WORKDIR /home/$USER

CMD ["/bin/bash"]