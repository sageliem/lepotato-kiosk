touch /root/.no_rootfs_resize

apt install dosfstools

touch /root/resize_data_partition.sh
cat << EOF > /root/provisioning.sh
storagedevice=findmnt / | awk -F" " '/\/dev\// {print $2"}
umount /mnt/data
echo "Expanding data partition ${storagedevice}"
echo ", +" | sfdisk -N 2 ${storagedevice}p2
echo "Resizing FAT32 filesystem"
fatresize -s 100% ${storagedevice}p2
echo "Done"
echo "Shutting down in 5 seconds. Add media and configuration files to the data partition of the SD card."
sleep 5
EOF

apt install cage lighttpd chromium
