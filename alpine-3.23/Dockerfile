FROM alpine:3.23

# Install development packages
RUN apk update \
    && apk add --no-cache \
        bash \
        curl \
        vim \
        cmake \
        clang \
        gcc \
        g++ \
        ninja-build \
        ninja-is-really-ninja \
        git \
        boost-dev \
        qt6-qtbase-dev \
        qt6-qtsvg-dev \
        qt6-qtcharts-dev \
        qt6-qt5compat-dev \
        python3-dev \
        py3-pybind11-dev \
        sudo \
        perl \
    && apk upgrade --no-cache

# Set up a non-root user
ARG USER=devuser
ARG UID=1000
RUN adduser -D -s /bin/bash -u $UID $USER \
    && echo "devuser ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR /home/$USER