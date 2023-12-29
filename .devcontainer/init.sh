#!/bin/bash

# Sources for debian

echo 'deb-src http://archive.ubuntu.com/ubuntu jammy main' >> /etc/apt/sources.list
echo 'deb-src http://archive.ubuntu.com/ubuntu jammy-updates main' >> /etc/apt/sources.list

# Set TZ to UTC

ln -fs /usr/share/zoneinfo/UTC /etc/localtime

# Main deps, from https://askubuntu.com/a/1435592

apt-get -y update \
apt-get -y build-dep --no-install-recommends linux linux-image-generic

# Additional deps

apt-get -y install --no-install-recommends libncurses-dev gawk flex bison openssl dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf llvm build-essential libncurses5-dev gcc bc dwarves

# Get source

cd /root
apt-get source linux-image-unsigned-$(uname -r)

# Build module

cd /root/linux*
cp /boot/config-* .config
chmod a+x debian/scripts/*
chmod a+x -R ./scripts \
make olddefconfig \
make modules_prepare \
make M=drivers/usb/usbip modules -j2
# make modules -j2

# Load modules
# docker cp {container}:/root/linux-5.15.0/drivers/usb/usbip/ /lib/modules/kernel/drivers/usb/
# depmod
# modprobe usbip-core
# modprobe vhci-hcd