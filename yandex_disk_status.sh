#!/bin/sh

status=$(yandex-disk status | awk '/core status/ {print $NF}')
used=$(yandex-disk status | awk '/Used/ {print $2}')
total=$(yandex-disk status | awk '/Total/ {print $2}')
items=$(yandex-disk status | tail -n 11 | head -5 | tr -d \')
# Without IFS if $line is too long for loop breaks it into multiple lines
IFS=$'\n'
message=$(echo $status $used/$total Gb)
# Strip paths and keep only basenames
# basenames=$(for line in $items; do basename "$line"; done)
notify-send "$message" "$items"
