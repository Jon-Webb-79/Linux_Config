***********
rsync usage
***********

1. Verify that ``rsync`` is installed

2. if not installed then install it

``$ sudo pacman -S rsync``

3. Backup to a thumb drive
   a. For the purpose of this conversation lets assume the drive is mounted
      at ``/run/media/jonwebb/drive_1``

   b. The first time backing up the home directory use the following 
      command

      ``$ rsync -arvn --dry-run home/ /run/media/jonwebb/drive_1``

      The above command will only test to ensure that you are backing up the right
      information, but will not back it up.

   c. Assuming the above command was successful then repear with the following command;

      ``$ rsync -arv /home/jonwebb/ /run/media/jonwebb/drive_1``

   d. Every time after that run;

      ``$ rsync -arv --delete /home/jonwebb/ /run/media/jonwebb/drive_1``

      The above command will delete files on the thumb drive, which were in a previous
      backup, but deleted from hte primary server since the last backup.
