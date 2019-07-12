#!/usr/bin/sh

udiskie-mount -a
mount_status=$?
if [ $mount_status -ne 0 ]; then
    notify-send 'An error occured' "Unable to mount device" --icon=dialog-information
else
    notify-send 'Success' "Device mounted" --icon=dialog-information
fi
