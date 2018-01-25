#!/bin/bash

xkbcomp -I$HOME/.xkb ~/.xkb/keymap/xkbtest $DISPLAY
s2cctl start
