***********************
Arch Linux Installation
***********************
This document describes the steps necessary to install Arch Linux on a computer or
Virtual Environment.  These instructions are for a UEFI enabled computer and will
lead to an encrypted hard drive and the installation of a Logical Volume Manager (LVM)
partition.  This installation will also set up a swap file instead of a swap partition.

1. Download Arch iso
#################
a. Navigate to the following website ``https://archlinux.org/download/`` 
b. Find any random web site under United States in the HTTP Direct Downloads
c. Click the option that ends with .iso and download to downloads folder
d. Use an application like USBImager to flash the iso to a thumb drive
e. Shut the computer off

2. Boot into the installer on the thumb drive
#############################################
a. With the thumb drive plugged into the computer, turn the computer on.
   As soon as the computer begins to power up, repeatedly depress the F12
   key to boot into the Bios mode
b. Once the bios menu has opened, verify that the computer has UEFI enabled
c. The bios should provide boot options. Click on the thumb drive option,
   which may be labeled as the sda option.  This should boot into the Arch Linux
   installer
**NOTE:** If this does not work, then you may need to go back into the bios and disable
          safe boot.
