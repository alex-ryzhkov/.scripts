#!/usr/bin/sh
echo "$remotedir"
function gethost {
    host=`grep -i 'host ' ~/.ssh/config | awk '{print $2}' | fzf`
    echo ${host}
}

function getremotedir {
    read -p "Enter remote directory to mount (default \"/\"): " remotedir
}

function getlocaldir {
    read -p "Enter local directory to mount (default \"~/remote\"): " localdir
}

function main {
    if [ -z "$remotedir" ]; then
        remotedir='/'
    fi
    if [ -z "$localdir" ]; then
        localdir="${HOME}/remote"
    fi
    sshfs -o allow_other ${host}:${remotedir} ${localdir}
}

gethost
getremotedir
getlocaldir
main
