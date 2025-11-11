# Le Potato Kiosk
Armbian build configuration for a Wayland kiosk running on the Libre Le Potato. Generates an sd card image with a minimized rootfs partition and a placeholder FAT32 data partition that expands on first boot.
## Installation
- Use a disk imaging tool like `dd` or balenaEtcher to flash the image on a 4GB+ microSD card.
- Boot up the Le Potato and allow the first boot provisioning script to run.
- Add config and media files to the data partition of the SD card (readable on a host computer).
## Building an Image
The easiest cross-platform way to compile an Armbian image is with [Multipass](https://canonical.com/multipass), according to the instructions [here](https://docs.armbian.com/Developer-Guide_Building-with-Multipass/). This is just a convenient way to set up an Ubuntu virtual machine, the officially supported build environment for Armbian. Once you've created the VM and cloned the `armbian/build` repo, just drop `userpatches/` in the build folder and run `./compile.sh lepotato-kiosk`.

`TODO` write a script for Multipass build

## Dependencies
The kiosk environment is based on `cage`, `chromium`, and `lighttpd` if running a local web server.
