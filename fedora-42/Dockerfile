FROM fedora:42

RUN dnf update -y \
        && \
    dnf install -y \
        @development-tools \
        vim \
        sudo \
        rpm-build \
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
        python3 \
        python3-devel \
        python3-pip \
        ncurses-devel \
        libtirpc \
        libtirpc-devel \
        postgresql-libs \
        postgresql-devel \
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
        && \
    dnf clean all

# Set up a non-root user
ARG USER=devuser
ARG UID=1000
RUN useradd -m -s /bin/bash -u $UID $USER && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chmod 0440 /etc/sudoers

USER $USER
WORKDIR /home/$USER

CMD ["/bin/bash"]