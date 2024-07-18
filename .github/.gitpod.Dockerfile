FROM ubuntu:20.04

USER root

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
    && rm miniconda.sh

# Update PATH to include Conda
ENV PATH /opt/conda/bin:$PATH

# Configure Conda
RUN conda config --add channels defaults \
    && conda config --add channels bioconda \
    && conda config --add channels conda-forge \
    && conda config --set channel_priority strict

# Create and activate the conda environment in one RUN step
RUN conda update --quiet --yes --all \
    && conda create --quiet --yes --name nextflow_course \
        mamba \
        nextflow \
        nf-core \
        nf-test \
        black \
        prettier \
        pre-commit \
        pytest-workflow \
    && conda clean --all --force-pkgs-dirs --yes \
    && echo "source activate nextflow_course" >> ~/.bashrc

# Update Nextflow
RUN source activate nextflow_course \
    && nextflow self-update \
    && nextflow -version

# Set the working directory
WORKDIR /workspace
