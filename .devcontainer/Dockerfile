FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu as build
WORKDIR /tmp/linux-src
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends bc bison build-essential ca-certificates curl flex libssl-dev libelf-dev linux-headers-$(uname -r) \
    && curl -fsSL https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.4.tar.gz | tar -xzf - --strip-components=1 \
    && make defconfig \
    && ([ ! -f /proc/1/root/proc/config.gz ] || zcat /proc/1/root/proc/config.gz > .config) \
    && printf '%s\n' 'CONFIG_USBIP_CORE=m' 'CONFIG_USBIP_VHCI_HCD=m' 'CONFIG_USBIP_VHCI_HC_PORTS=8' 'CONFIG_USBIP_VHCI_NR_HCS=1' >> .config \
    && make oldconfig modules_prepare \
    && make M=drivers/usb/usbip \
    && mkdir -p /dist \
    && cd drivers/usb/usbip \
    && cp usbip-core.ko vhci-hcd.ko /dist

TODO: figure out how to pass uname -r to COPY
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu
COPY --from=build /dist/* /lib/modules/5.4.0-1086-azure/
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends linux-modules-extra-$(uname -r) linux-tools-generic usbutils
