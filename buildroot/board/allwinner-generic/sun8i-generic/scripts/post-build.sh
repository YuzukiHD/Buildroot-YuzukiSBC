#!/bin/sh
BOARD_COMMON_DIR="$(dirname $0)/../../$4"
BOARD_DIR="$(dirname $0)/../../../$6"

# For debug
echo "Target binary dir $BOARD_COMMON_DIR"
echo "Target Board $BOARD_DIR"

# Copy Platfrom Files to BINARY_DIR
cp $BOARD_COMMON_DIR/bin/* -rfvd  $BINARIES_DIR

# Copy common file to BINARY_DIR
cp $BOARD_COMMON_DIR/../sunxi-generic/bin/* -rfvd  $BINARIES_DIR

# overlay bin file to BINARY_DIR
cp $BOARD_DIR/bin/* -rfvd  $BINARIES_DIR

cd $BINARIES_DIR
echo "item=dtb, $5" >> boot_package.cfg

$BINARIES_DIR/dragonsecboot  -pack boot_package.cfg
$BINARIES_DIR/mkenvimage -r -p 0x00 -s 131072 -o env.fex env.cfg
mkbootimg --kernel zImage  --ramdisk  ramdisk.img --board sun8iw20p1 --base  0x40200000 --kernel_offset  0x0 --ramdisk_offset  0x01000000 -o  boot.img
