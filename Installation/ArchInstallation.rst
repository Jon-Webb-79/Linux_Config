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

.. code-block:: bash

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

    **NOTE: In this case the device is wlan0, which I will use in place of device name from here on out.**

d. scan for available networks

   ``$ station wlan0 scan``

e. Query for the list of available stations

   ``$ station wlan0 get-networks``

f. If your wireless network is on the list connect to the network with the following comand.
   You may be prompted for a password after entering the command

   ``$ station wlan0 connect "NetworkName"``

    **NOTE: If your network is not on the list, you may need to fix something with your router**

g. Exit the iwd prompt by typing ``Control-d``

h. Now that you are back in the base installer type the following command to verify
   that you now have a wireless connection

   ``$ ip a``

i. Verify data flow is occuring.  Type the following command to ping the google DNS server with data packages

   ``$ ping -c 5 8.8.8.8``

5. Partition the Hard Drive
###########################
a. Find what the device name is for the hard disk

   ``$ fdisk -l``

**NOTE: This may result in many options being displayed; however, options titled loop should be ignored.  In addition, options with sd may likely be the thumb drive or other mounter peripheral devices.  In my case, the hard drive is titled nvme0n1.  The p1, p2, and p3 that follow nvme0n1 are the partition numbers.  For the remainder of this tutorial I will refer to the hard drive as nvme01n1**

b. Enter the partition manager for the computer

   ``$ fdisk /dev/nvme0n1``

**NOTE: This should yield the following request 'Command (m for help)'**

c. Type p and hit enter to see the existing partitions.  This should match the partitions
   shown when you ran the ``fdisk -l`` command.  Once the command is complete it should
   return to the 'Command (m for help) query, and will from here on out, so I will omit
   all references to it

d. Enter the following command to start a fresh partition layout

  ``$ g``

e. Start a new partition layout

   ``$ n``

"**NOTE: THis should yield the following response and input.**"  Inputs are in '' marks

.. code-block:: bash

      -Partition number (1-128, default 1): 'press enter to accept default'
      -First sector (some numbers, default 2048) 'press enter to accept default'
      -Last sector, +/- sectors or +/- size{K,M,G,T,P} (some numbers, default 1048575966)
       '+500M'
      
This should result in 'Created a new partition 1 of type 'Linux filesystem' and of size 500 MiB'

f. Set the partition type

   ``$ t``

    -Partition type or alias (type L to list all): '1'
    -Changed type of partition 'Linux' filesystem to 'EFI System'
g. Create second partition

   ``$ n``

   -Partition number (2-128, default 2): 'press enter to accept default'

   -First sector(some numbers, default 1026048): 'press enter to accept the default'

   -Last sector, +/- sectors or +/- size{K,M,G,T,P} (some numbers, default 1048575966)

   '+500M'

   This should result in a 'Create a new partition 2 of type 'Linux filesystem' and of size 500 MiB'
   Unlike the last partition, we will format this one at a later time

f. Create third and final partition

   ``$ n``

    -Partition number (3-128, default 3): 'press enter to accept the default'

    -First sector (some numbers, default 2050048): 'press enter to accept the default'

    -Last sector, +/- sectors or +/- size{K,M,G,T,P} (some numbers, default 1048575966)

    'press enter to take up the remainder of the hard disk' 

g. Set the partition type

   ``$ t``

    -Partition number(1-3, default 3): 'press enter to accept the default'

    -Partition type or alias (type L to list all) '30'

    This should yield 'Changed type of partition 'Linux Filesystem' to 'Linux LVM''

h. Verify partitions

   ``$ p``

    Should yield the following.  XXX means the numbers are variable.  REM means remaining space

    Device          Start   End     Sectors    Size    Type 

    /dev/nvme0n1p1  XXX     XXX     XXX        500M    EFI System

    /dev/nvm10n1p2  XXX     XXX     XXX        500M    Linux Filesystem

    /dev/nvme0n1p3  XXX     XXX     XXX        REMG    Linux LVM

    i"**NOTE: If the output looks different, then you may need to repartition your hard drive**"

i. Finalize changes (NOTE: This step blows away your current operating system)

   ``$ w``

    **NOTE: After this step, if you run fdisk -l, it should mirror your newly set up partition layout**

j. Format partitions.  This will format your first partition as a vfat file structure
   and the second as the ext4 file structure.

   ``$ mkfs.fat -F32 /dev/nvme0n1p1``

   ``$ mkfs.ext4 /dev/nvme0n1p2``

k. Set up encryption on the third partition. Click yes, when asked Are you Sure and be
   prepared to enter a password of your choosing

   ``$ cryptsetup luksFormat /dev/nvme0n1p3``

l. Unlock the encrypted drive

   ``$ cryptsetup open --type luks /dev/nvme0n1p3 lvm``

m. Set up lvm

   ``$ pvcreate --dataalignment 1m /dev/mapper/lvm``

   ``$ vgcreate volgroup0 /dev/mapper/lvm``

   ``$ lvcreate -L 30GB volgroup0 -n lv_root``

   ``$ lvcreate -l 100%FREE volgroup0 -n lv_home``

   ``$ modprobe dm_mod``

   ``$ vgscan``

   ``$ vgchange -ay``

   **NOTE: This should find and activate 2 logical volumes**

   ``$ mkfs.ext4 /dev/volgroup0/lv_root``

   ``$ mount /dev/volgroup0/lv_root /mnt``

   ``$ mkdir /mnt/boot``

   ``$ mount /dev/nvme0n1p2 /mnt/boot``

   ``$ mkfs.ext4 /dev/volgroup0/lv_home``

   ``$ mkdir /mnt/home``

   ``$ mount /dev/volgroup0/lv_home /mnt/home``

   ``$ mkdir /mnt/etc``

   ``$ genfstab -U -p /mnt >> /mnt/etc/fstab``

   **NOTE: This next command is to verify the output of the fstab.  if it does not look like this example, you have made a mistake.**

   ``$ cat /mnt/etc/fstab``

      /dev/mapper/volgroup0-lv_root

      UUID=random number     /        ext4 rw,relatime 0 1

      /dev/nvme0n1p2

      UUID=random number     /boot    ext4 rw,relatime 0 2

      /dev/mapper/volgroup0-lv_home

      UUID=random number     /home    ext4 rw,relatime 0 2

6. Install Linux
################
a. Install base packages

   ``$ pacstrap -i /mnt base``

b. Enter root

   ``$ arch-chroot /mnt``

c. Install linux and Linux long term supported kernes with firmware.

   **NOTE: If you are installing on a virtual machine, omit linux-firmware from the following command**

   ``$ pacman -S linux linux-headers linux-lts linux-lts-headers linux-firmware``

d. Install gvim

   ``$ pacman -S gvim``

e.  Install more base packages for wireless internet

    ``$ pacman -S base-devel openssh``

f. enable ssh to ensure it starts when your computer does

   ``$ systemctl enable sshd``

g. Install networking packages

   ``$ pacman -S networkmanager wpa_supplicant wireless_tools netctl dialog``

h. Enable the network manager

   ``$ systemctl enable NetworkManager``

i. Install lvm support

   ``$ pacman -S lvm2``

j. Change a line in the /etc/mkinitcpio.conf file

   ``$ vim /etc/mkinitcpio.conf``

   **NOTE: Fin the following lines and change from was to to is**

   was

   HOOKS=(base udev autodetect modconf block filesystem keyboard fsck)

   is

   HOOKS=(base udev autodetect modconf block encrypt lvm2 filesystem keyboard fsck) 

k. Type command to force mkinitcpio changes take effect

   ``$ mkinitcpio -p linux``

   ``$ mkinitcpio -p linux-lts``

   **NOTE: You should see lvm and encrypt in the bottom of the output for both commands**

l. Edit /etc/locale.gen file

   ``$ vim /etc/locale.gen``

   was

   #en_US.UTF-8 UTF-8

   is

   en_US.UTF-8 UTF-8

m. activate changes to locale.gen

   ``$ locale-gen``

n. Set the root password

   ``$ passwd``

o. Add yourself as a user.  My username is jonwebb

   ``$ useradd -m -g users -G wheel jonwebb``

   ``$ passwd jonwebb``

p. Ensure sudo is installed

   ``$ which sudo``

   **NOTE: if the command provides no output then install sudo with pacman**

q. Associate the user with wheel and all priveldges

   ``$ EDITOR=vim visudo``

   was

   #%wheel ALL=(ALL) ALL

   is

   %wheel ALL=(ALL) ALL

   **NOTE: If you are adding a user other than yourself, you may want to soecify specific commands in this section that are allowed to the user**

7. Install Grub
###############
a. Install GRUB and related packages

   ``$ pacman -S grub efibootmgr dosfstools os-prober mtools``

b. Create the following directory

   ``$ mkdir /boot/EFI``

   ``$ mount /dev/nvme0n1p1 /boot/EFI``

c. Install GRUB to the master boot record

   ``$ grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck``

d. Create the locale directory if it does not exist

   ``$ ls -l /boot/grub``

   if it does not exist

   ``$ mkdir /boot/grub/locale``

e. Copy a specific file to the correct directory

   ``$ cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo``

f. Edit /etc/default/grub file

   ``$ vim /etc/default/grub``

   was

   GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"

   #GRUB_ENABLE_CRYPTODISK=y

   is

   GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=/dev/nvme0n1p3:volgroup0:allow-discards loglevel=3 quiet"

   GRUB_ENABLE_CRYPTODIS=y 

g. Generate the grub configuration file

   ``$ grub-mkconfig -o /boot/grub/grub.cfg``

h. At this point you should be able to properly boot your installation without the iso flash drive attach

   ``$ exit``
   ``$ umount -a``
   ``$ reboot``

8. Make some post installation tweaks
#####################################

a. Assume the root user

   ``$ su``

   ``$ cd /root``

a. Create and activate a swap file

   ``$ dd if=/dev/zero of=/swapfile bs=1M count=2048 status=progress``

   ``$ chmod 600 /swapfile``

   ``$ mkswap /swapfile``

   ``$ cp /etc/fstab /etc/fstab.bak``

   ``$ echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab``

   ``$ cat /etc/fstab``

   Verify that the pervious command is now in the fstab file

   ``$ mount -a``

   **NOTE: If the prior command causes errors, something must be fixed**

   ``$ swapon -a``

   ``$ free -m``

b. Check the available timezones, mine is Amerca/Denver

   ``$ timedatectl list-timezones``

   ``$ timedatectl set-timezone America/Denver``

   ``$ systemctl enable systemd-timesyncd``

c. Set the host name to webbmachine

   ``$ hostnamectl set-hostname webbmachine``

   Verify the host name was set up

   ``$ cat /etc/hostname``

   Setup the hostname file with vim

   ``$ vim /etc/hosts``

   Static table lookup for hostnames

   ``See hosts(5) for details``

   ``127.0.0.1  localhost``

   ``::1        localhost``

   ``127.0.1.1  webbmachine.localadmin webbmachine``

d. Install the microcode for our cpu

   - for intel

   ``$ pacman -S intel-ucode``

   - for AMD

   ``$ pacman -S amd-ucode``

e. Install xorg

   ``$ pacman -S xorg-server``

f. Install video driver

   - For intel or AMD

   ``$ pacman -S mesa``

   - For nvidia

   ``$ pacman -S nvidia nvidia-lts``

   - Virtual Machine

   ``$ pacman -S virtualbox-guest-utils xf86-video-vmware``

   ``$ systemctl enable vboxservice``

9. Install Desktop Environment
##############################
**GNOME**

``$ sudo pacman -S gnome gnome-tweaks gnome-extra``

**NOTE: if the install does not recognize a keychain type**

``$ sudo pacman-key --refresh-keys``

``$ systemctl enable gdm``

``$ reboot``

**KDE-PLASMA**

``$ sudo pacman -S plasma kde-applications``

``$ systemctl enable sddm``

``$ reboot``

10. System Backup
#################
a. Move ``backup`` file from ``Troubleshooting`` directory to ``/usr/local/bin`` directory
b. Ensure that ``/usr/local/bin`` is in path with the command ``echo $PATH``.  If not, add it to ``.zsh_profile`` or ``.bash_profile``
c. Execute system backup with the command ``sudo backup``
