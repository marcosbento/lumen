FROM alpine:3.23

# Install development packages
RUN apk update \
    && apk add --no-cache \
        bash \
        curl \
        vim \
        cmake \
        clang \
        clang-dev \
        llvm \
        llvm-dev \
        bison flex \
        gcc \
        g++ \
        gfortran \
        ninja-build \
        ninja-is-really-ninja \
        make \
        git \
        boost-dev \
        qt6-qtbase-dev \
        qt6-qtsvg-dev \
        qt6-qtcharts-dev \
        qt6-qt5compat-dev \
        python3-dev \
        curl-dev \
        sudo \
        perl \
    && apk upgrade --no-cache

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
RUN adduser -D -s /bin/bash -u $UID $USER \
    && echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR /home/$USER