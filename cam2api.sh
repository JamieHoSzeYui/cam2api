#!/bin/bash

home=$(cd /data/data/com.termux/files/home && pwd)

if [ `whoami` != 'root' ]
  then
    echo "You must be root to do this."
    
fi
check="$(grep "persist.vendor.camera.HAL3" /system/build.prop)"
if [ "$check" != 'persist.vendor.camera.HAL3.enabled=1' ]
  then
    echo "This script is used to enable cam2api"

    echo "Backing Up original buildprop for removing cam2api"
    cp /system/build.prop $home/cam2api/backup/original.prop

    echo "Writing cam2api to /system/build.prop"
    cat $home/cam2api/build.prop >> /system/build.prop

    echo "...done"
    echo "Rebooting...."
    reboot
    exit
fi
echo "Cam2api enabled already in build.prop"
