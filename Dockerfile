FROM ubuntu:16.04

# Change APT Source for Chinese Users
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

# Download basic build tools
RUN apt-get update \
    && apt-get install --yes --no-install-recommends wget unzip build-essential \
    git bc swig libncurses5-dev libpython3-dev libssl-dev pkg-config zlib1g-dev \
    libusb-dev libusb-1.0-0-dev python3-pip gawk \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /YuzukiSBC/Buildroot

COPY buildroot ./buildroot