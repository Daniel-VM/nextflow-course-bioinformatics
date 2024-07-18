FROM ubuntu:20.04

# Set non-interactive mode for the installation
ENV DEBIAN_FRONTEND=noninteractive

# Install basic dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    unzip \
    bzip2 \
    ca-certificates \
    sudo \
    software-properties-common \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Install Conda
RUN curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o miniconda.sh \
    && bash miniconda.sh -b -p /opt/conda \
    && rm miniconda.sh \
    && /opt/conda/bin/conda init bash

# Update PATH to include Conda
ENV PATH /opt/conda/bin:$PATH

# Install Docker
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    && apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io \
    && usermod -aG docker root

# Install Singularity
RUN apt-get update && apt-get install -y \
    libseccomp-dev \
    pkg-config \
    squashfs-tools \
    cryptsetup \
    && rm -rf /var/lib/apt/lists/*

RUN export VERSION=3.8.0 && \
    wget https://github.com/hpcng/singularity/releases/download/v${VERSION}/singularity-${VERSION}.tar.gz && \
    tar -xzf singularity-${VERSION}.tar.gz && \
    cd singularity && \
    ./mconfig && \
    make -C builddir && \
    make -C builddir install

# Install Nextflow
RUN curl -fsSL https://get.nextflow.io | bash \
    && mv nextflow /usr/local/bin/

# Set the working directory
WORKDIR /course_workspace

# Expose Docker daemon socket for Docker-in-Docker
VOLUME /var/run/docker.sock:/var/run/docker.sock
