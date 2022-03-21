# Buildroot Package for YuzukiHD Devices and More Devices

[Documentation](https://yuzukihd.gloomyghost.com/Buildroot-YuzukiSBC/#/) &mdash;
[Releases](https://github.com/YuzukiHD/Buildroot-YuzukiSBC/releases) &mdash;
[License](https://github.com/YuzukiHD/Buildroot-YuzukiSBC/blob/master/LICENSE)

Mirror: https://gitee.com/GloomyGhost/Buildroot-YuzukiSBC 

[![forthebadge](https://forthebadge.com/images/badges/contains-cat-gifs.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/compatibility-betamax.svg)](https://forthebadge.com)

## Supported Devices

|  Vender  | Device      | Chip    | U-Boot  | Linux   | Defconfig |
| -------- | ----------- | ------- | ------- | ------- | --------- |
| YuzukiHD | YuzukiRuler | F1C200s | 2020.07 | 5.4.180 | YuzukiHD_YuzukiRuler_defconfig |
| YuzukiHD | YuzukiCore F1 | F1C200s | 2020.07 | 5.4.180 | YuzukiHD_YuzukiCore_F1_defconfig |
| Sipeed   | lichee nano | F1C100s | 2020.07 | 5.4.180 | Sipeed_lichee_nano_defconfig |
| Sipeed   | lichee zero | V3s | 2020.07 | 5.4.180 | Sipeed_lichee_zero_defconfig |
| AWOL   | nezha | D1 | smaeul,u-boot | smaeul,linux | aw-ol_nezha_defconfig |

## Documents

[Documentation](https://yuzukihd.gloomyghost.com/Buildroot-YuzukiSBC/#/)

## Notice

This Buildroot development package is a fork of https://github.com/mangopi-sbc/buildroot-mangopi-r which is a fork of https://github.com/aodzip/buildroot-tiny200

## About buildroot

```
Buildroot is a simple, efficient and easy-to-use tool to generate embedded
Linux systems through cross-compilation.

The documentation can be found in docs/manual. You can generate a text
document with 'make manual-text' and read output/docs/manual/manual.text.
Online documentation can be found at http://buildroot.org/docs.html

To build and use the buildroot stuff, do the following:

1) run 'make menuconfig'
2) select the target architecture and the packages you wish to compile
3) run 'make'
4) wait while it compiles
5) find the kernel, bootloader, root filesystem, etc. in output/images

You do not need to be root to build or run buildroot.  Have fun!

Buildroot comes with a basic configuration for a number of boards. Run
'make list-defconfigs' to view the list of provided configurations.

Please feed suggestions, bug reports, insults, and bribes back to the
buildroot mailing list: buildroot@buildroot.org
You can also find us on #buildroot on Freenode IRC.

If you would like to contribute patches, please read
https://buildroot.org/manual.html#submitting-patches
```


