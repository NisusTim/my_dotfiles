#!/bin/bash
#BRIGHTNESS_1="xrandr --output HDMI-1 --brightness 0.8"
BRIGHTNESS_2="xrandr --output VGA-1 --brightness 0.6"
KEY_MAPPING="xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'"

#eval $BRIGHTNESS_1
eval $BRIGHTNESS_2
eval $KEY_MAPPING
