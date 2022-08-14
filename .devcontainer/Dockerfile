FROM mcr.microsoft.com/vscode/devcontainers/base:alpine as build
WORKDIR /tmp/linux-src
RUN apk add --no-cache --update ca-certificates libc-dev linux-headers libressl-dev elfutils-dev curl gcc bison flex make musl-dev \
    && curl -fsSL https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.4.tar.gz | tar -xzf - --strip-components=1 \
    && make defconfig \
    && ([ ! -f /proc/1/root/proc/config.gz ] || zcat /proc/1/root/proc/config.gz > .config) \
    && printf '%s\n' 'CONFIG_USBIP_CORE=m' 'CONFIG_USBIP_VHCI_HCD=m' 'CONFIG_USBIP_VHCI_HC_PORTS=8' 'CONFIG_USBIP_VHCI_NR_HCS=1' >> .config \
    && make oldconfig modules_prepare \
    && make M=drivers/usb/usbip \
    && mkdir -p /dist \
    && cd drivers/usb/usbip \
    && cp usbip-core.ko vhci-hcd.ko /dist

FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu
COPY --from=build /dist/* /usbipclient/
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends linux-tools-generic usbutils