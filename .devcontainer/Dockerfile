# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.0/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version (use ubuntu-22.04 or ubuntu-18.04 on local arm64/Apple Silicon): ubuntu-22.04, ubuntu-20.04, ubuntu-18.04
ARG VARIANT="jammy"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT} as build
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends build-essential curl gcc bison flex make

RUN KERNELVER=5.4 \
    && curl -fsSL https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-${KERNELVER}.tar.gz | tar -xzf - --strip-components=1 \
    && make defconfig \
    && zcat /proc/1/root/proc/config.gz > .config \
    && printf '%s\n' 'CONFIG_USBIP_CORE=m' 'CONFIG_USBIP_VHCI_HCD=m' 'CONFIG_USBIP_VHCI_HC_PORTS=8' 'CONFIG_USBIP_VHCI_NR_HCS=1' >> .config \
    && make oldconfig modules_prepare \
    && make M=drivers/usb/usbip \
    && mkdir -p ~/dist \
    && cd drivers/usb/usbip \
    && cp usbip-core.ko vhci-hcd.ko ~/dist

# ARG VARIANT="jammy"
# FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}
# # COPY --from=build ~/dist/* /usbipclient/
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends linux-tools-generic usbutils