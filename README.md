# usbip-codespaces

## How to build the kernel module

Modified from [BuildYourOwnKernel](https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel). Kernel is currently targetting `6.2.0-1018-azure`.

1. Spin up a VM using the latest 22.04 desktop
2. Enable sources for apt
3. Build deps: `sudo apt-get build-dep linux linux-image-unsigned-6.2.0-1018-azure`
4. Packages: `sudo apt-get install libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf llvm`
5. Source: `apt-get source linux-image-unsigned-6.2.0-1018-azure`
6. Copy the kernel config from the host located at `/boot/config*` and save it as `.config` in the source root
7. Use `menu makeconfig` to enable USB/IP
8. Modify the root `Makefile` so that the version magic to matches (see https://www.jianshu.com/p/122e6c18e058)
9. Run `make`
