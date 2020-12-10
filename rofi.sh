#!/usr/bin/env bash

LAYOUT=$(xset -q | grep -A 0 'LED' | cut -c 63)
if [[ ${LAYOUT} -eq 0 ]]; then
    rofi -combi-modi window,drun -show combi -modi combi -font "Terminus 10" -drun-display-format {name} -show-icons
else
    setxkbmap us
    rofi -combi-modi window,drun -show combi -modi combi -font "Terminus 10" -drun-display-format {name} -show-icons
    setxkbmap -layout us,ru -option grp:win_space_toggle
fi
