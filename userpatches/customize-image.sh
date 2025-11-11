touch /root/.no_rootfs_resize

apt install dosfstools

touch /root/resize_data_partition.sh
cat << EOF > /root/provisioning.sh
datadevice=findmnt / | awk -F" " '/\/dev\// {print $2"}
echo "Expanding data partition ${datadevice}"
echo ", +" | sfdisk -N 2 ${datadevice}p2
echo "Resizing FAT32 filesystem"
fatresize -s 100% ${datadevice}p2
echo "Done"
EOF

apt install cage lighttpd chromium
