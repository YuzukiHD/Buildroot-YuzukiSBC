<h1 align="center">Buildroot for YuzukiSBC</h1>
<p align="center">Open Source development package for for yuzukihd Boards and more boards</p>

# Support Lists
|  Vender  | Device      | Chip    | U-Boot  | Linux   | Defconfig |
| -------- | ----------- | ------- | ------- | ------- | --------- |
| YuzukiHD | YuzukiRuler | F1C200s | 2020.07 | 5.4.180 | yuzukihd_yuzukiruler_defconfig |
| YuzukiHD | YuzukiCore F1 | F1C200s | 2020.07 | 5.4.180 | yuzukihd_yuzukicore_f1_defconfig |
| Sipeed   | lichee nano | F1C100s | 2020.07 | 5.4.180 | sipeed_lichee_nano_defconfig |
| Sipeed   | lichee zero | V3s | 2020.07 | 5.4.180 | sipeed_lichee_zero_defconfig |
| awol   | nezha | D1 | tina,uboot 2018 | smaeul,linux | awol_nezha_defconfig |


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
git clone https://github.com/yuzukihd/Buildroot-YuzukiSBC
cd Buildroot-YuzukiSBC
```

## Make the first build
**Notice: Root permission is not necessery for build firmware.**

```
source envsetup.sh    # Set the build environment
lunch                 # Change to Buildroot Directory
```

### Apply defconfig
**Caution: Apply defconfig will reset all buildroot configurations to default values.**

**Generally, you only need to apply it once.**
```shell
make *Defconfig Name*

eg.

make yuzukihd_yuzukiruler_defconfig
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

# Script

## env

### wsl_path

If you are using the `WSL` environment, please run this command to clear the `WSL` environment variables before compiling, otherwise the following error will occur.

```
Your PATH contains spaces, TABs, and/or newline (\n) characters.
This doesn't work. Fix you PATH.
support/dependencies/dependencies.mk:27: recipe for target 'dependencies' failed
make: *** [dependencies] Error 1
```

### board file trees and defconfigs

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