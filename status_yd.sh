#!/bin/sh

status=$(yandex-disk status | awk '/Sync/ {print $4}')
used=$(yandex-disk status | awk '/Used/ {print $2}')
total=$(yandex-disk status | awk '/Total/ {print $2}')
items=$(yandex-disk status | tail -n 11 | cut -c 8- | head -5 | tr -d \')
# Without IFS if $line is too long for loop breaks it into multiple lines
IFS=$'\n'
# Strip paths and keep only basenames
basenames=$(for line in $items; do basename "$line"; done)
message=$(echo $status $used/$total Gb)
# Make sure that each filename is on its own line
names=$(for name in $basenames; do echo $name; done)
notify-send "$message" "$names"
