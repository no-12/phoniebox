# BO's Phoniebox

This project contains resources needed to create a [Phoniebox](https://github.com/MiczFlor/RPi-Jukebox-RFID).

## Case

All 3D model files are in the [scad directory](scad). They are created with OpenSCAD.

### Create stl files

Requirements: OpenSCAD

There is a [script](export_scad_to_stl.sh) to create all stl files.

### Print

#### Frame

- 0.20 mm layer height
- 15% infill
- support on build plate only

#### Side

- 0.20 mm layer height
- 100% infill
- no support

## Hardware

## Software

### Prepare SD card

- Download the latest Raspberry Pi OS

- Copy image to sd card

  ```shell
  unzip 2021-10-30-raspios-bullseye-armhf-lite.zip
  sudo dd if=2021-10-30-raspios-bullseye-armhf-lite.img of=/dev/sdX bs=4M conv=fsync status=progress
  ```

- Create an emtpy file named `ssh` in the boot partition of the sd-card to enable the ssh server on the first boot of the raspberry pi

- Add the following to `/boot/wpa_supplicant.conf`

  ```
  ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
  update_config=1
  country=DE
  network={
      ssid="<SSID>"
      psk="<PASSWORD>"
  }
  ```

- Copy ssh key to raspberry pi
  ```shell
  ssh-copy-id -i ~/.ssh/id_rsa.pub pi@X.X.X.X
  ```
