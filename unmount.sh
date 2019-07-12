#!/usr/bin/sh

udiskie-umount -a
mount_status=$?
if [ $mount_status -ne 0 ]; then
    notify-send 'An error occured' "Unable to unmount device" --icon=dialog-information
else
    notify-send 'Success' "Device unmounted" --icon=dialog-information
fi
