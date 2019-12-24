#!/usr/bin/sh

pic="$(find  ~/pictures/memes -type f | fzf --preview='viu -w 60 {}')"
url="$(curl -F "file=@\"$pic\"" https://0x0.st)"
echo $url | xclip -selection clipboard
