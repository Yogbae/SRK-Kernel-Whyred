#!/bin/bash

export KERNELNAME=SRK-Kernel-VIP-Edition-Whyred

export LOCALVERSION=SRK-Kernel-VIP-Edition

export KBUILD_BUILD_USER=WhysDev

export KBUILD_BUILD_HOST=DroneCI

export TOOLCHAIN=clang

export DEVICES=whyred

export CI_ID=-1001258546004

export GROUP_ID=-456289175

source helper

gen_toolchain

send_msg "⏳ Start building ${KERNELNAME} ${LOCALVERSION} | DEVICES: whyred

send_pesan "⏳ Start building ${KERNELNAME} ${LOCALVERSION} | DEVICES: whyred

START=$(date +"%s")

for i in ${DEVICES//,/ }
do
	build ${i} -oldcam

	build ${i} -newcam
done

send_msg "⏳ Start building Overclock version | DEVICES: whyred

send_pesan "⏳ Start building Overclock version | DEVICES: whyred

git apply oc.patch

git apply em.patch

for i in ${DEVICES//,/ }
do
	if [ $i == "whyred" ]
	then
		build ${i} -oldcam -overclock

		build ${i} -newcam -overclock
	fi
done

END=$(date +"%s")

DIFF=$(( END - START ))

send_msg "✅ Build completed in $((DIFF / 60))m $((DIFF % 60))s | Linux version : $(make kernelversion) | Last commit: $(git log --pretty=format:'%s' -5)"

send_pesan "✅ Build completed in $((DIFF / 60))m $((DIFF % 60))s | Linux version : $(make kernelversion) | Last commit: $(git log --pretty=format:'%s' -5)"
