
<div align = center>

# Buildroot YuzukiSBC
*Buildroot Package Mainly for YuzukiHD Devices. Support Allwinner F1C100s/200s V3s V3x D1-H D1s T113*

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
</div>

## Supported Device Lists
Please visit [Support Lists Page]

## Basic Start-up

```
git clone https://github.com/yuzukihd/Buildroot-YuzukiSBC # Clone the code of Buildroot-YuzukiSBC
cd Buildroot-YuzukiSBC                                    # Change to the directory
source envsetup.sh                                        # Set the build environment
lunch                                                     # lunch the buildroot environment
make yuzukihd_yuzukiruler_defconfig                       # Select target board
make                                                      # Build and pack
```
For more details, please check [Documentation]

## About Buildroot

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

[Support Lists Page]: https://yuzukihd.gloomyghost.com/Buildroot-YuzukiSBC/#/SupportList

[License]: LICENSE

[Mirror]: https://gitee.com/GloomyGhost/Buildroot-YuzukiSBC 
[CI]: https://ci.appveyor.com/project/GloomyGhost-MosquitoCoil/buildroot-yuzukisbc
