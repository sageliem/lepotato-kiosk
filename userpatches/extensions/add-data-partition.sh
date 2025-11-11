# adds a 64MiB FAT32 data partition after the default rootfs

function prepare_image_size__add_data_freespace() {
  display_alert "HOOK: add_data_freespace"
  declare -g EXTRA_ROOTFS_MIB_SIZE=64
  display_alert "Exiting hook"
}

function post_create_partitions__add_data_partition() {
  display_alert "HOOK: add_data_partition"
  display_alert "Shrinking rootfs by EXTRA_ROOTFS_MIB_SIZE=${EXTRA_ROOTFS_MIB_SIZE}"
  echo "-${EXTRA_ROOTFS_MIB_SIZE}M" | run_host_command_logged sfdisk -N 1 ${SDCARD}.raw
  display_alert "Appending data partition"
  echo ",${EXTRA_ROOTFS_MIB_SIZE},b" | run_host_command_logged sfdisk "${SDCARD}".raw --append || exit_with_error "Create partition table fail"
  display_alert "Exiting hook"
}

function format_partitions__format_data_partition() {
  display_alert "HOOK: format_data_partition"
  run_host_command_logged mkfs.fat -F 32 ${LOOP}p2
  display_alert "Exiting hook"
}

function format_partitions__600_update_fstab() {
  display_alert "HOOK: update_fstab"
  mkdir -p /mnt/data
  echo "UUID=$(blkid -s UUID -o value ${LOOP}p2) /mnt/data vfat defaults 0 0" >> $SDCARD/etc/fstab
  display_alert "Exiting hook"
}
