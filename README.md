# Le Potato Kiosk
Armbian build configuration for a Wayland kiosk running on the Libre Le Potato. Generates an sd card image with a minimized rootfs partition and a placeholder FAT32 data partition that expands on first boot.
# Instructions
- Use a disk imaging tool like `dd` or balenaEtcher to flash the image on a 4GB+ microSD card.
- Boot up the Le Potato and allow the first boot provisioning script to run.
- Add config and media files to the data partition of the SD card (readable on a host computer).
