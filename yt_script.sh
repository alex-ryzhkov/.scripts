#!/usr/bin/sh

link="$(xclip -selection c -o)"
mpv $link
play_status=$?
if [ $play_status -ne 0 ]; then
    msg='Failed to open '$link
    notify-send 'An error occured' "$(echo $msg)" --icon=dialog-information
fi
