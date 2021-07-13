#!/bin/bash
export KBUILD_BUILD_USER=WhysDev
export KBUILD_BUILD_HOST=SRK
export CROSS_COMPILE=aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=arm-linux-gnueabi-
# Compie plox
function compile() {
    make -j$(nproc) O=out ARCH=arm64 whyred_defconfig
    make -j$(nproc) ARCH=arm64 O=out \
                              CC=clang-12
}
compile
