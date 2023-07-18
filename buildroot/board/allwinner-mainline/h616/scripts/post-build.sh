#!/bin/sh

MKIMAGE=$HOST_DIR/bin/mkimage
BOOT_CMD="board/mangopi/mq-quad/boot.cmd"

# mkimage -C none -A arm64 -T script -d boot.cmd boot.scr
${MKIMAGE} -C none -A arm64 -T script -d ${BOOT_CMD} ${BINARIES_DIR}/boot.scr
