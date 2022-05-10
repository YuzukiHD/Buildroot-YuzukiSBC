
<div align = center>

# Buildroot YuzukiSBC
*Buildroot Package for YuzukiHD Devices. Support Allwinner F1C100s/200s V3s V3x D1-H D1s T113*

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

 Vendor  | Device      | Chip    | U-Boot  | Linux   | Defconfig |
:------: | :---------: | :-----: | :-----: | :-----: | :-------: |
*YuzukiHD* | *YuzukiRuler* | `F1C200s` | `2020.07` | `5.4.180` | `yuzukihd_yuzukiruler_defconfig`
*YuzukiHD* | *YuzukiCore F1* | `F1C200s` | `2020.07` | `5.4.180` | `yuzukihd_yuzukicore_f1_defconfig` |
*YuzukiHD* | *YuzukiCK1N* | `V3x` | `2022.01` | `5.4.180` | `yuzukihd_yuzukick1n_defconfig` |
*YuzukiHD* | *R11 86 Panel* | `R11` | `2022.01` | `5.4.180` | `yuzukihd_r11_86panel_defconfig` |
*Sipeed*   | *Lichee Nano* | `F1C100s` | `2020.07` | `5.4.180` | `sipeed_lichee_nano_defconfig` |
*Sipeed*   | *Lichee Zero* | `V3s` | `2020.07` | `5.4.180` | `sipeed_lichee_zero_defconfig` |
*Awol*     | *Nezha* | `D1-H` | `Tina` `UBoot 2018` | `Tina` `Linux 2018` | `awol_nezha_defconfig` |
*Awol*     | *Nezha-D1s* | `D1s` | `Tina` `UBoot 2018` | `Tina` `Linux 2018` | `awol_nezha_d1s_defconfig` |
*MangoPi*  | *MQ* | `D1s` | `Tina` `UBoot 2018` | `Tina` `Linux 2018` | `mangopi_mq_defconfig` |
*MangoPi*  | *MQ Dual* | `T113` | `longan` `UBoot 2018` | `longan` `Linux 2018` | `mangopi_mq_dual_defconfig` |
*MangoPi*  | *MQ Pro* | `D1-H` | `Tina` `UBoot 2018` | `Tina` `Linux 2018` | `mangopi_mq_pro_defconfig` |

<br>

---

<br>


## Fork Tree

<kbd align = left>
<br>
<br>
  
   **[Tiny200]**   <br><br>
   ⤷ **[MangoPi-R]**   <br><br>
    ⤷ **YuzukiSBC**   

<br>
</kbd>

<br>

---

<br>

## About Buildroot

</div>


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
