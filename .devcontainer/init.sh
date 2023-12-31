#!/bin/bash

apt-get -y update
apt-get -y install wget kmod
wget https://github.com/beriberikix/usbip-codespaces/releases/download/test/usbip.tar.gz
tar -xvf usbip.tar.gz -C /lib/modules/$(uname -r)/kernel/drivers/usb
depmod
modprobe usbip-core
modprobe vhci-hcd