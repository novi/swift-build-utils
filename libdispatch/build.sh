#!/usr/bin/env bash

SCRIPT_DIR=``"$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"``

sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    sudo apt-get update

sudo apt-get install -y autoconf libtool libkqueue-dev libkqueue0 libcurl4-openssl-dev libbsd-dev libblocksruntime-dev && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

cd && \
    git clone --recursive -b experimental/foundation https://github.com/apple/swift-corelibs-libdispatch.git && \
    pushd swift-corelibs-libdispatch

patch -p0 < $SCRIPT_DIR/01-include-header.patch

sh ./autogen.sh && \
./configure --with-swift-toolchain=${SWIFT_ROOT}/usr --prefix=${SWIFT_ROOT}/usr && \
make && make install && popd
