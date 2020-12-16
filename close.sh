#!/usr/bin/env bash

NAME=$(xdotool getwindowfocus getwindowname)
if [[ ${NAME} == *"GoldenDict"* ]]; then
    i3-msg "[class="GoldenDict"] scratchpad show"
elif [[ ${NAME} == "support" ]]; then
    i3-msg "[title="^support$"] scratchpad show"
elif [[ ${NAME} == *"gedit"* ]]; then
    i3-msg "[class="Gedit"] scratchpad show"
elif [[ ${NAME} == *"GVIM"* ]]; then
    i3-msg "[class="Gvim"] scratchpad show"
elif [[ ${NAME} == *"cool-retro-term"* ]]; then
    i3-msg "[class="cool-retro-term"] scratchpad show"
else
    i3-msg kill
fi
