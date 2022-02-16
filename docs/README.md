<h1 align="center">Buildroot for YuzukiSBC</h1>
<p align="center">Open Source development package for Allwinner F1C100s & F1C200s</p>

## Driver support
Check this file to view current driver support progress for F1C100s/F1C200s: [PROGRESS-SUNIV.md](PROGRESS-SUNIV.md)

## Install

### Install necessary packages
``` shell
sudo apt install rsync wget unzip build-essential git bc swig libncurses-dev libpython3-dev libssl-dev
sudo apt install python3-distutils
```

### Download BSP
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

### If changed DTS or kenrel build
```shell
./rebuild-kernel.sh
```

### If changed Uboot, build
```shell
./rebuild-uboot.sh
```

## Flashing firmware to target
You can flash a board by Linux (Recommended) or Windows system.
### [Here is the manual.](flashutils/README.md)

## Helper Scripts
- rebuild-uboot.sh: Recompile U-Boot when you direct edit U-Boot sourcecode.
- rebuild-kernel.sh: Recompile Kernel when you direct edit Kernel sourcecode.
- emulate-chroot.sh: Emulate target rootfs by chroot.