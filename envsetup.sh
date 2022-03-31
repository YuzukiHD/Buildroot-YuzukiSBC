#!/bin/bash

# WSL SUpport
if [ $(uname -r | grep -c "WSL1") -eq 1 ]
then 
    echo "Buildroot-YuzukiSBC Not Support WSL 1"
elif [ $(uname -r | grep -c "WSL2") -eq 1 ]
then 
    echo "Buildroot-YuzukiSBC Now running on WSL2, setting PATH..."
    export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib"
fi

# Alias
alias lunch="cd buildroot && echo -e \"You're building on Linux\n\nLunch menu... Scaning combo... \npick a combo by 'make xxx_defconfig':\" && make list-defconfigs"
alias rebuild_kernel="touch ./output/images/a.dtb && rm ./output/images/*.dtb && make linux-rebuild -j8 && make"
alias rebuild_uboot="make uboot-rebuild -j8 && make"
alias wsl_path="export PATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib\""
alias sync_kernel="rm -rf output/build/linux* && rm -rf output/build/.linux* && make"

echo "Setup env done! Please run lunch next."
