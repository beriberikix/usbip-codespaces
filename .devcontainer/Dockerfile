FROM ubuntu:latest

# Load USBIP modules from host

RUN \
    depmod \
    && modprobe usbip-core \
    && modprobe vhci-hcd \
    && apt install linux-tools-generic hwdata usbutils
# usbip list -r {{IP addr}}