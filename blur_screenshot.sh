#/bin/sh

scrot -e 'convert $f -blur 0x4 /tmp/blur_screenshot.png && rm $f'
