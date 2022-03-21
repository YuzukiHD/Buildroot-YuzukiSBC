<h1 align="center">Buildroot for YuzukiSBC</h1>
<p align="center">Open Source development package for for YuzukiHD Boards and more boards</p>

# Support Lists
|  Vender  | Device      | Chip    | U-Boot  | Linux   | Defconfig |
| -------- | ----------- | ------- | ------- | ------- | --------- |
| YuzukiHD | YuzukiRuler | F1C200s | 2020.07 | 5.4.180 | YuzukiHD_YuzukiRuler_defconfig |
| YuzukiHD | YuzukiCore F1 | F1C200s | 2020.07 | 5.4.180 | YuzukiHD_YuzukiCore_F1_defconfig |
| Sipeed   | lichee nano | F1C100s | 2020.07 | 5.4.180 | Sipeed_lichee_nano_defconfig |
| Sipeed   | lichee zero | V3s | 2020.07 | 5.4.180 | Sipeed_lichee_zero_defconfig |
| AWOL   | nezha | D1 | smaeul,u-boot | smaeul,linux | aw-ol_nezha_defconfig |


# Install

The recommended operating system is `Ubuntu 18.04 WSL` and `Ubuntu 20.04 WSL`. If you want to use a virtual machine or a physical machine running linux, please troubleshoot the problem by yourself. There is no solution here.

## Install necessary packages
``` shell
sudo apt install rsync wget unzip build-essential git bc swig libncurses-dev libpython3-dev libssl-dev
sudo apt install python3-distutils
```

## Download Buildroot BSP
**Notice: Root permission is not necessery for download or extract.**
```shell
git clone https://github.com/YuzukiHD/Buildroot-YuzukiSBC
cd Buildroot-YuzukiSBC
```

## Make the first build
**Notice: Root permission is not necessery for build firmware.**

```
source build/envsetup.sh    # Set the build environment
lunch                       # Change to Buildroot Directory
```

### Apply defconfig
**Caution: Apply defconfig will reset all buildroot configurations to default values.**

**Generally, you only need to apply it once.**
```shell
make *Defconfig Name*

eg.

make YuzukiHD_YuzukiRuler_defconfig
```

### Regular build
```shell
make
```

### If changed DTS or kernel build
```shell
rebuild-kernel
```

### If changed Uboot, build
```shell
rebuild-uboot
```

### If added linux patches, build
```shell
sync_kernel
```

## Flashing firmware to target

### Flashing to SD Card
#### Using balenaEtcher

Download balenaEtcher at [https://www.balena.io/etcher/](https://www.balena.io/etcher/)

#### Using dd
```
cd buildroot/output/images/              # To System img dir
sudo dd if=sdcard.img of=/dev/sdX bs=4M  # dd it
```

### Flashing to SPI-NAND
#### Using XFEL

Get XFEL at [github.com/xboot/xfel](https://github.com/xboot/xfel/releases/)

```shell
cd buildroot/output/images/                # To System img dir
xfel.exe spinand                            # Checkout device connection
xfel.exe spinand write 0 sysimage-nand.img   # Write System to devices
```

### Flashing to SPI-NOR
#### Using XFEL

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
