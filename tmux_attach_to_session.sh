#/bin/sh
session=$(tmux list-sessions | rofi -dmenu | awk '{print $1}' | tr -d :)
if [ -z $session ]; then
    exit 1
fi
$MYTERM -e "tmux attach-session -t $session"

