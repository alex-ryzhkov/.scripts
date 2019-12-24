#!/bin/sh

FILE="/tmp/i3_current_show_desktop"
if [ -f "$FILE" ]; then
    i3-msg "[con_mark="current"] focus; unmark current"
    rm $FILE
else
    i3-msg "mark current; workspace show desktop"
    touch $FILE
fi
