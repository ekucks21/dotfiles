#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $DIR/.xkb ~/.xkb

if [ ! -d ~/sb/Space2Ctrl ]; then
    cd ~/sb
    git clone https://github.com/r0adrunner/Space2Ctrl.git
    cd ~/sb/Space2Ctrl
    make
    sudo make install
fi

xkbcomp -I$HOME/.xkb ~/.xkb/keymap/xkbtest $DISPLAY
s2cctl stop
s2cctl start
