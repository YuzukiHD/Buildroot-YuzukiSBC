#!/bin/sh
BOARD_DIR="$(dirname $0)../../$1"

if grep -q ^BR2_MY_LOGIN_SYSTEM=y ${BR2_CONFIG}
then
    cp $BOARD_DIR/bin/* -rfvd  $BINARIES_DIR
    cd $BINARIES_DIR
    $BINARIES_DIR/dragonsecboot  -pack boot_package.cfg
    mkbootimg --kernel  Image  --ramdisk  ramdisk.img --board  d1-nezha_min --base  0x40200000 --kernel_offset  0x0 --ramdisk_offset  0x01000000 -o  boot.img
else
    # For debug
    echo $BOARD_DIR
fi