#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $DIR/.xkb ~/.xkb

if [ ! -d ~/sb/Space2Ctrl ]; then
    cd ~/sb
    sudo apt-get install libx11-dev libxtst-dev
    git clone https://github.com/r0adrunner/Space2Ctrl.git
    cd ~/sb/Space2Ctrl
    make
    sudo make install
fi

xkbcomp -I$HOME/.xkb ~/.xkb/keymap/xkbtest $DISPLAY
# s2cctl stop
# pkill -f -9 s2c
# s2cctl start
