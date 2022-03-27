#!/bin/bash
alias lunch="cd buildroot && echo -e \"You're building on Linux\n\nLunch menu... Scaning combo... \npick a combo by 'make xxx_defconfig':\" && make list-defconfigs"
alias rebuild_kernel="rm ./output/images/*.dtb && make linux-rebuild -j8 && make"
alias rebuild_uboot="make uboot-rebuild -j8 && make"
alias wsl_path="export PATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib\""
alias sync_kernel="rm -rf output/build/linux* && rm -rf output/build/.linux* && make"

echo "Setup env done! Please run lunch next."