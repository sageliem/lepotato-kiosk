#!/bin/bash

# First boot config
touch /root/.no_rootfs_resize
cp /tmp/overlay/not_logged_in_yet /root/.not_logged_in_yet
cp /tmp/overlay/provisioning.sh /root/provisioning.sh

apt install fatresize cage lighttpd chromium

# Set up Cage service
mkdir -p /etc/systemd/system/
cp /tmp/overlay/cage@.service /etc/systemd/system/cage@.service
# PAM autologin
mkdir -p /etc/pam.d/
cp /tmp/overlay/pam-cage /etc/pam.d/cage
# Set graphical target as default
ln -s /usr/lib/systemd/system/graphical.target /etc/systemd/system/default.target
