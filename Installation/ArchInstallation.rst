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
**NOTE: If this does not work, then you may need to go back into the bios and disable safe boot.**

3. Set keyboard Layout.
#######################
**NOTE: If you are using a U.S. Keyboard, you can skip this step**

a. View the keyboard layout options with the following command
   ``$ ls /usr/share/kbd/keymaps/**/*.map.gz``
b. Change the layout with the 'loadkeys' option.  The following is an example if the
   user wants to use the 'de-latin' layout
   ``$ loadkeys de-latin``

4. Verify Wireless connection.
##############################
**NOTE: The user should ensure that they have a hardwire and wireless connection before beginning the install**

a. type the following command to see the internet connections.

   ``$ ip a``
    **NOTE: This should yield something similar to the text below, except the either option may be empty, indicating that the wireless needs to be activated;**

    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
       link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
       inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
       inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
    2: wlp0s20f3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
       link/ether fc:44:82:a4:7a:63 brd ff:ff:ff:ff:ff:ff
       inet 192.168.86.24/24 brd 192.168.86.255 scope global dynamic noprefixroute wlp0s20f3
       valid_lft 69747sec preferred_lft 69747sec
       inet6 fe80::6cd:4d12:77c7:1c40/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
b. To enter the wireless manager type the following command

   ``$ iwctl``
c. Check for your device name:

   ``$ device list``
    NOTE: In this case the device is wlan0, which I will use in place of device name
          from here on out.
d. scan for available networks

   ``$ station wlan0 scan``
e. Query for the list of available stations

   ``$ station wlan0 get-networks``
f. If your wireless network is on the list connect to the network with the following comand.
   You may be prompted for a password after entering the command

   ``$ station wlan0 connect "NetoworkName"``

    **NOTE: If your network is not on the list, you may need to fix something with your router**

g. Exit the iwd prompt by typing ``Control-d``
h. Now that you are back in the base installer type the following command to verify
   that you now have a wireless connection

   ``$ ip a``
i. Verify data flow is occuring.  Type the following command to ping the google DNS server with data packages

   ``$ ping -c 5 8.8.8.8``
