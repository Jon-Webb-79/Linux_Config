*****************
USB Configuration
*****************
This file describes how to configure and format usb drives
to include backup drives and thumb drives.

1. Determine where the backup drive is located

   a. Type ``df`` to determine where the drive is located.  For this example
      lets assume the drive is ``/dev/sda1``

   b. Unmount the drive with the following command;

      ``$ sudo umount /dev/sda1``

   c. Format the drive to a linux format

      ``$ sudo mkfs.ext4 /dev/sda1``

2. Rename the drive

   a. Ensure that ``e2label`` is installed

      ``$ which e2label``

      If the above command returns nothing, then ``e2label`` is not
      installed, and can be installed with the following command.

      ``$ sudo pacman -S e2label``

   b. Re-label the drive

      ``$ sudo e2label /dev/sda1 user_defined_drive_name``
