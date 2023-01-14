FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu
RUN \
    apt-get update \
    && apt-get install -y linux-tools-virtual hwdata \
    && update-alternatives --install /usr/local/bin/usbip usbip $(ls /usr/lib/linux-tools/*/usbip | tail -n1) 20