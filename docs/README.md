<h1 align="center">Buildroot for YuzukiSBC</h1>
<p align="center">Open Source development package for for yuzukihd Boards and more boards</p>

# Support Lists

✅: Supported — ❌: Not Supported Yet — ⚠️: Not Fully Supported Yet

|  Vender  | Device      | Chip    | U-Boot  | Linux   | Defconfig | SPI NOR | SPI NAND | SD CARD | EMMC |
| -------- | ----------- | ------- | ------- | ------- | --------- | --------- | --------- | --------- | --------- |
| YuzukiHD | YuzukiRuler | F1C200s | 2020.07 | 5.4.180 | yuzukihd_yuzukiruler_defconfig | ✅ | ✅ | ✅ | ✅ |
| YuzukiHD | YuzukiCore F1 | F1C200s | 2020.07 | 5.4.180 | yuzukihd_yuzukicore_f1_defconfig | ✅ | ✅ | ✅ | ✅ |
| YuzukiHD | YuzukiCK1N | V3x | 2022.01 | 5.4.180 | yuzukihd_yuzukick1n_defconfig | ❌ | ❌ | ✅ | ⚠️ |
| Sipeed   | lichee nano | F1C100s | 2020.07 | 5.4.180 | sipeed_lichee_nano_defconfig | ✅ | ✅ | ✅ | ✅ |
| Sipeed   | lichee zero | V3s | 2020.07 | 5.4.180 | sipeed_lichee_zero_defconfig | ❌ | ❌ | ✅ | ⚠️ |
| awol   | nezha | D1 | tina,uboot 2018 | tina,linux 2018 | awol_nezha_defconfig | ❌ | ❌ | ✅ | ❌ |


# Install BSP

The recommended operating system is `Ubuntu 18.04 WSL` and `Ubuntu 20.04 WSL`. If you want to use a virtual machine or a physical machine running linux, please troubleshoot the problem by yourself. There is no solution here.

## Install necessary packages
``` shell
sudo apt install rsync wget unzip build-essential git bc swig libncurses-dev libpython3-dev libssl-dev python3-distutils
```

## Download Buildroot BSP

!> **Notice: Root permission is not necessery for download or extract.**

!> **For WSL2 Users: Please don't put this SDK in Windows partition, please put it under Linux partition, `/mnt/` must not appear in the path.**

```shell
git clone https://github.com/yuzukihd/Buildroot-YuzukiSBC
cd Buildroot-YuzukiSBC
```

<script id="asciicast-3MEG180VlNrbn8omy9kXnUAq1" src="https://asciinema.org/a/3MEG180VlNrbn8omy9kXnUAq1.js" async></script>

# Build firmware

## Make the first build
!> **Notice: Root permission is not necessery for build firmware.**

```
source envsetup.sh    # Set the build environment
lunch                 # Change to Buildroot Directory
```

<script id="asciicast-DGoDTEy5g9ForXGItWTRZj6or" src="https://asciinema.org/a/DGoDTEy5g9ForXGItWTRZj6or.js" async></script>

### Apply defconfig
!> **Caution: Apply defconfig will reset all buildroot configurations to default values. Generally, you only need to apply it once.**

```shell
make *Defconfig Name*

eg.

make yuzukihd_yuzukiruler_defconfig
```

### Regular build
```shell
make
```

<script id="asciicast-tfNdVjs1lM36OQk74qO6FAyve" src="https://asciinema.org/a/tfNdVjs1lM36OQk74qO6FAyve.js" async></script>

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

# Flashing Firmware

## Flashing to SD Card
### Using balenaEtcher

Download balenaEtcher at [https://www.balena.io/etcher/](https://www.balena.io/etcher/)

![xfel_driver_1](https://raw.githubusercontent.com/YuzukiHD/Buildroot-YuzukiSBC/master/docs/assets/img/balenaEtcher.png)

### Using dd
```
cd buildroot/output/images/              # To System img dir
sudo dd if=sdcard.img of=/dev/sdX bs=4M  # dd it
```

## Flashing to SPI-NAND
### Using XFEL

Get XFEL at [github.com/xboot/xfel](https://github.com/xboot/xfel/releases/)

!> XFEL Driver install [Instructions](/?id=xfel-driver-install)

```shell
cd buildroot/output/images/             # To System img dir
xfel spinand                            # Checkout device connection
xfel spinand write 0 sysimage-nand.img  # Write System to devices
```

### Using sunxi-fel

Get sunxi-fel at [github.com/linux-sunxi/sunxi-tools](https://github.com/linux-sunxi/sunxi-tools/releases)

```shell
cd buildroot/output/images/                            # To System img dir
sunxi-fel -p spiflash-write 0 sysimage-nand.img        # Write System to devices
```

## Flashing to SPI-NOR

### Using sunxi-fel

Get sunxi-fel at [github.com/linux-sunxi/sunxi-tools](https://github.com/linux-sunxi/sunxi-tools/releases)

```shell
cd buildroot/output/images/                            # To System img dir
sunxi-fel -p spiflash-write 0 sysimage-nor.img         # Write System to devices
```

### Using XFEL

Get XFEL at [github.com/xboot/xfel](https://github.com/xboot/xfel/releases/)

!> XFEL Driver install [Instructions](/?id=xfel-driver-install)

```shell
cd buildroot/output/images/            # To System img dir
xfel spinor                            # Checkout device connection
xfel spinor write 0 sysimage-nor.img   # Write System to devices
```

<script id="asciicast-470363" src="https://asciinema.org/a/470363.js" async></script>

# Built-in Script

## For Environment

`wsl_path`

If you are using the `WSL` environment, please run this command to clear the `WSL` environment variables before compiling, otherwise the following error will occur.

```
Your PATH contains spaces, TABs, and/or newline (\n) characters.
This doesn't work. Fix you PATH.
support/dependencies/dependencies.mk:27: recipe for target 'dependencies' failed
make: *** [dependencies] Error 1
```

## For Build

`lunch`

Lunch 🚀 to buildroot.

`rebuild_kernel`

Delete the generated dtb and rebuild the kernel

`rebuild_uboot`

Rebuild the U-Boot

`sync_kernel`

Modify the kernel-related patch or need to restore the original kernel

# Appendix

## board file trees and file path definition

Buildroot-YuzukiSBC uses a custom directory structure, and the following descriptions need to be met when submitting code.

```tree
├── Vender
│   ├── Board1
│   │   ├── config         # Place Defconfig
│   │   │   ├── linux      # Place Linux Defconfig
│   │   │   └── uboot      # Place U-boot Defconfig
│   │   ├── dts            # Place Device Trees for U-Boot and Linux (dts)
│   │   ├── patch          # Place Patches
│   │   └── rootfs         # Rootfs Overlays
│   └── Board2
│       ├── config         # Place Defconfig
│       │   ├── linux      # Place Linux Defconfig
│       │   └── uboot      # Place U-boot Defconfig
│       ├── dts            # Place Device Trees for U-Boot and Linux (dts)
│       ├── patch          # Place Patches
│       │   ├── linux      # Place Patches for linux
│       │   └── uboot      # Place Patches for U-boot
│       └── script         # Place Script for uboot/linux
└── allwinner-generic      # Allwinner Generic Configs
    ├── suniv-f1c100s      # Chip Code - Chip Name
    │   ├── configs        # Place Default Defconfig
    │   │   ├── linux      # Place Linux Defconfig
    │   │   └── uboot      #
    │   ├── dts            # Place Device Trees (dtsi)
    │   │   ├── linux      # Device Trees For linux
    │   │   └── uboot      # Device Trees For U-boot
    │   ├── patch          # Place Patches
    │   │   ├── linux      # Place Patches for linux
    │   │   └── uboot      # Place Patches for U-boot
    │   └── rootfs         # Rootfs Overlays
    └── suniv-generic      # Chip Line Generic
```

## For Allwinner SUN20IW1P1 Platform

### OpenSBI-D1

For the sun20iw1p1(D1-H, D1s) platform, we introduced its stable version of OpenSBI as Supervisor Binary Interface. Which is not compatible with the upstream mainline OpenSBI. 

### post-build.sh

Since the main line currently lacks support for chips and has fewer drivers, the BSP kernel and U-boot are used here. The compilation method and startup method are quite different from the mainline. This script is used here as the connection.

Since Buildroot does not provide dedicated ARGS for Post Script, it is shared with `BR2_ROOTFS_POST_SCRIPT_ARGS`, so it needs to be written together with the packaging script here. 

#### Usage

```
post-build.sh -c xxxx.cfg      <platform> <target dtb>
              ^for pack image  ^for post-build.sh
```

In config

```
BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/awol/nezha-d1s/script/genimage.cfg sun20i-d1s sun20i-d1s-nezha-linux.dtb"
```

## XFEL Driver install

First, open zadig under the XFEL driver folder and select `List All Devices`

![xfel_driver_1](https://raw.githubusercontent.com/YuzukiHD/Buildroot-YuzukiSBC/master/docs/assets/img/xfel_driver_1.png)

Then select Allwinner USB Device `VID_1f3a_PID_efe8`, and replace the driver with WinUSB

![xfel_driver_2](https://raw.githubusercontent.com/YuzukiHD/Buildroot-YuzukiSBC/master/docs/assets/img/xfel_driver_2.png)