#!/bin/bash

apt install wget
wget https://firebasestorage.googleapis.com/v0/b/usbip-docker.appspot.com/o/usbip-jammy.tar.gz?alt=media&token=f71e0574-dc46-40d6-a38b-9c26c1114c77

# cd /root/linux*
# cp /boot/config-* .config
# chmod a+x debian/scripts/*
# chmod a+x -R ./scripts \
# make olddefconfig \
# make modules_prepare \
# make M=drivers/usb/usbip modules -j2
# # make modules -j2

# # Load modules
# # docker cp {container}:/root/linux-5.15.0/drivers/usb/usbip/ /lib/modules/kernel/drivers/usb/
# # depmod
# # modprobe usbip-core
# # modprobe vhci-hcd