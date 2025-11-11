#!/bin/bash
set -e
echo "Provisioning started"
storagedevice=findmnt / | awk -F" " '/\/dev\// {print $2"}'
umount /mnt/data
echo "Expanding data partition ${storagedevice}"
echo ", +" | sfdisk -N 2 ${storagedevice}p2
echo "Resizing FAT32 filesystem"
fatresize -s 100% ${storagedevice}p2
echo "Provisioning complete. Shut down device now and add media to SD card"
