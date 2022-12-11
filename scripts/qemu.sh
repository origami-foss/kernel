#!/bin/sh

cd "${MESON_SOURCE_ROOT}/.."

if [ "$1" = "i686" ]; then
	if ! command -v qemu-system-i386 &> /dev/null
	then
		echo "fatal: qemu-system-i386 not installed"
		exit 1
	fi

	qemu-system-i386 \
		-s -S \
		-m 512 \
		-chardev stdio,id=char0,logfile=serial.log,signal=off \
		-serial chardev:char0 \
		-cdrom "${MESON_BUILD_ROOT}/paper.iso"
fi
