FROM ubuntu:latest

# Load USBIP modules from host

RUN \
  apt-get -y update \
  && apt-get -y install --no-install-recommends \
  git \
  kmod \
  && apt-get clean \
  && rm -rf /var/lib/lists/*  
  # depmod \
  # && modprobe usbip-core \
  # && modprobe vhci-hcd \
  # && apt install linux-tools-generic hwdata usbutils
  # usbip list -r {{IP addr}}