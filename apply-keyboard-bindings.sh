#!/bin/bash

export KBD_DEV=/dev/input/by-id/usb-CM_Storm_QuickFire_Rapid_keyboard-event-kbd
CONFIG=$(envsubst < bindings.kbd)
kmonad <(echo "$CONFIG")

export KBD_DEV=/dev/input/by-id/usb-Kinesis_Advantage2_Keyboard_314159265359-if01-event-kbd
CONFIG=$(envsubst < bindings.kbd)
kmonad <(echo "$CONFIG")
