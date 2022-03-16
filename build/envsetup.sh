#!/bin/bash

PWD

alias cbr="cd buildroot"
alias rebuild_kernel="rm ./output/images/*.dtb && make linux-rebuild -j8 && make"
