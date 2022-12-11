#!/bin/sh

srcdir="$1"
input_kernel="$2"
output_image="$3"
isoroot="$4"

mkdir -p "$isoroot/boot/grub"

cp "$srcdir/grub.cfg" "$isoroot/boot/grub/grub.cfg"
cp "$input_kernel" "$isoroot/paper"

if ! command -v grub2-mkrescue &> /dev/null
then
    echo "fatal: grub2-mkrescue not installed"
    exit 1
fi

grub2-mkrescue -o "$output_image" "$isoroot"
