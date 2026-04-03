FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    openssh-client \
    clang \
    clang-format \
    clang-tools \
    make \
    net-tools \
    valgrind \
    python3-pip \
    vim \
    curl \
    build-essential \
    man-db \
    ca-certificates \ 
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD ["/bin/bash"]
