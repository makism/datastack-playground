FROM eclipse-temurin:8 as cluster-base
LABEL python_version=python3.10

RUN apt-get update
RUN apt-get install -y \
    iputils-ping \
    python3 \
    python3-pip \
    python3-dev \
    libsasl2-dev \
    curl \
    vim \
    wget \
    software-properties-common \
    ssh \
    net-tools \
    ca-certificates \
    rsync
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
