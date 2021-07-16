#!/bin/bash

export KERNELNAME="SRK-Kernel-V14

export LOCALVERSION=V14

export KBUILD_BUILD_USER=WhysDev

export KBUILD_BUILD_HOST=SRK

export TOOLCHAIN=gcc

export DEVICES=whyred

source helper

gen_toolchain

send_msg "Start building ${KERNELNAME} ${LOCALVERSION} for ${DEVICES}..."

START=$(date +"%s")

for i in ${DEVICES//,/ }
do
	build ${i} -oldcam

	build ${i} -newcam
done

END=$(date +"%s")

DIFF=$(( END - START ))

send_msg "Build succesfully in $((DIFF / 60))m $((DIFF % 60))s"
