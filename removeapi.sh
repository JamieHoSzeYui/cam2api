#!/bin/bash

home=$(cd /data/data/com.termux/files/home && pwd)                                                                  home=$(cd /data/data/com.termux/files/home && pwd)

if [ `whoami` != 'root' ]
  then
    echo "You must be root to do this."
    end
fi

if [ "$(ls $home/cam2api/backup)" = 'original.prop' ]
  then
    echo "Removing cam2api..."
    echo "Replacing Original Build.prop..."
    cp $home/cam2api/backup/original.prop /system/build.prop
    echo "...done"
    echo "\n Now rebooting"
    reboot
    exit
fi
echo "No backup of original build.prop exits. Did u uninstall termux after enabling cam2api using this script?"

