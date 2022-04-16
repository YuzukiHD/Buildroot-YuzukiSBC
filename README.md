
<div align = center>

# Buildroot YuzukiHD 
*BuildRoot Package for YuzukiHD Devices and Others*

<br>

[Documentation] &mdash;
[Releases] &mdash;
[License] &mdash;
[Mirror]

<br>

![Badge Cats]
![Badge Betamax]
[![Badge Build]][CI]

<br>

---

<br>

|  Vender  | Device      | Chip    | U-Boot  | Linux   | Defconfig |
| -------- | ----------- | ------- | ------- | ------- | --------- |
| YuzukiHD | YuzukiRuler | F1C200s | 2020.07 | 5.4.180 | yuzukihd_yuzukiruler_defconfig |
| YuzukiHD | YuzukiCore F1 | F1C200s | 2020.07 | 5.4.180 | yuzukihd_yuzukicore_f1_defconfig |
| YuzukiHD | YuzukiCK1N | V3x | 2022.01 | 5.4.180 | yuzukihd_yuzukick1n_defconfig |
| Sipeed   | lichee nano | F1C100s | 2020.07 | 5.4.180 | sipeed_lichee_nano_defconfig |
| Sipeed   | lichee zero | V3s | 2020.07 | 5.4.180 | sipeed_lichee_zero_defconfig |
| awol   | nezha | D1-H | tina,uboot 2018 | tina,linux 2018 | awol_nezha_defconfig |
| awol   | nezha-d1s | D1s | tina,uboot 2018 | tina,linux 2018 | awol_nezha_d1s_defconfig |
| mangopi   | MQ | D1s | tina,uboot 2018 | tina,linux 2018 | mangopi_mq_defconfig |
| mangopi   | MQ Dual | T113 | longan,uboot 2018 | longan,linux 2018 | mangopi_mq_dual_defconfig |
| mangopi   | MQ Pro | D1-H | tina,uboot 2018 | tina,linux 2018 | mangopi_mq_pro_defconfig |

<br>

---

<br>

</div>



## Documents

[Documentation]

## Notice

This Buildroot development package is a fork of  which is a fork **[MangoPi-R]** of **[Tiny200]**

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



<!----------------------------------------------------------------------------->

[Badge Betamax]: https://forthebadge.com/images/badges/compatibility-betamax.svg
[Badge Build]: https://ci.appveyor.com/api/projects/status/qa7iq9ip0g3nh96c?retina=true
[Badge Cats]: https://forthebadge.com/images/badges/contains-cat-gifs.svg

[Documentation]: https://yuzukihd.gloomyghost.com/Buildroot-YuzukiSBC/#/
[Releases]: https://github.com/yuzukihd/Buildroot-YuzukiSBC/releases

[License]: LICENSE

[Mirror]: https://gitee.com/GloomyGhost/Buildroot-YuzukiSBC 
[CI]: https://ci.appveyor.com/project/GloomyGhost-MosquitoCoil/buildroot-yuzukisbc


[MangoPi-R]: https://github.com/mangopi-sbc/buildroot-mangopi-r
[Tiny200]: https://github.com/aodzip/buildroot-tiny200