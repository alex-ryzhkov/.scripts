#!/usr/bin/bash

gethost() {
    host=$(grep -i 'host ' ~/.ssh/config | awk '{print $2}' | fzf)
}

getremotedir() {
    read -p "Enter remote directory to mount (default \"/\"): " remotedir
}

getlocaldir() {
    read -p "Enter local directory to mount (default \"~/remote\"): " localdir
}

main() {
    gethost
    if [ -z "$host" ]; then
        exit
    fi
    getremotedir
    if [ -z "$remotedir" ]; then
        remotedir='/'
    fi
    getlocaldir
    if [ -z "$localdir" ]; then
        localdir="${HOME}/remote"
    fi
    sshfs -o allow_other "${host}":"${remotedir}" "${localdir}"
}

main
