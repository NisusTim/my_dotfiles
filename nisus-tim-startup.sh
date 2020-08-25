#!/bin/bash

export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

#BRIGHTNESS_1="xrandr --output HDMI-1 --brightness 0.8"
BRIGHTNESS_2="xrandr --output VGA-1 --brightness 0.6"

#eval $BRIGHTNESS_1
eval $BRIGHTNESS_2

hash easystroke 2>/dev/null && ! pgrep -x easystroke && easystroke &
hash xmodmap 2>/dev/null && xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
