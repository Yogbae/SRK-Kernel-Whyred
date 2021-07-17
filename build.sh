#!/bin/bash

export KERNELNAME="BraZzerz

export LOCALVERSION=V1

export KBUILD_BUILD_USER=Yogbae

export KBUILD_BUILD_HOST=YB

export TOOLCHAIN=gcc

export DEVICES=begonia

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
