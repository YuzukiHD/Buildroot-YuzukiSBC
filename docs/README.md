<h1 align="center">Buildroot for YuzukiSBC</h1>
<p align="center">Open Source development package for for YuzukiHD Boards and more boards</p>

# Support Lists
| Provider | Device      | Chip    | U-Boot  | Linux   |
| -------- | ----------- | ------- | ------- | ------- |
| YuzukiHD | YuzukiRuler | F1C200s | 2020.07 | 5.4.180 |
| Sipeed   | lichee-nano | F1C100s | 2020.07 | 5.4.180 |



# Install

The recommended operating system is `Ubuntu 18.04 WSL` and `Ubuntu 20.04 WSL`. If you want to use a virtual machine or a physical machine running linux, please troubleshoot the problem by yourself. There is no solution here.

## Install necessary packages
``` shell
sudo apt install rsync wget unzip build-essential git bc swig libncurses-dev libpython3-dev libssl-dev
sudo apt install python3-distutils
```

## Download BSP
**Notice: Root permission is not necessery for download or extract.**
```shell
git clone https://github.com/YuzukiHD/Buildroot-YuzukiSBC
```

## Make the first build
**Notice: Root permission is not necessery for build firmware.**

Do not use `sudo`

### Apply defconfig
**Caution: Apply defconfig will reset all buildroot configurations to default values.**

**Generally, you only need to apply it once.**
```shell
make YuzukiHD_YuzukiRuler_defconfig
```

### Regular build
```shell
make
```

### If changed DTS or kernel build
```shell
./rebuild-kernel.sh
```

### If changed Uboot, build
```shell
./rebuild-uboot.sh
```

## Flashing firmware to target
### Using XFEL

Get XFEL at [github.com/xboot/xfel](https://github.com/xboot/xfel/releases/)

```shell
cd buildroot/output/images/                # To System img dir
xfel.exe spinor                            # Checkout device connection
xfel.exe spinor write 0 sysimage-nor.img   # Write System to devices
```

<script id="asciicast-470363" src="https://asciinema.org/a/470363.js" async></script>

## Helper Scripts
- rebuild-uboot.sh: Recompile U-Boot when you direct edit U-Boot sourcecode.
- rebuild-kernel.sh: Recompile Kernel when you direct edit Kernel sourcecode.
- emulate-chroot.sh: Emulate target rootfs by chroot.
