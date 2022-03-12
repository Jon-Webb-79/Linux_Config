*************************
Arch Linux Update Process
*************************
This file provides the step by step process used to update Arch Linux.
The user should strive to update their distribution once every one
to two days if possible.

1. Check to see if any units have failed

``$ systemctl --failed``

2. Check for errors in the log files

``$ journalctl -p 3 -b``

3. Backup hard drive.  This assumes that the user has added the 
   ``backup.sh`` file to the ``/etc`` directory.

``$ sudo bash /etc/backup.sh``

4. Update the Arch repository

``$ sudo pacman -Syu``

5. Update the Arch User Repository

``$ yay -S Syu``

6. Remove pacman caches

``$ sudo pacman -Sc``

7. Remove AUR caches

``$ yay -Sc``

8. For aggressive cache removal (not recommended)

``$ sudo pacman -S Scc``

9. For aggressive AUR cache removal (not recommended)

``$ yay -Scc``

10. Remove unwanted dependencies

``$ yay -Yc``

11. Check for orphan packages

``$ sudo pacman -Qtdq``

12. Cleanup orphan packages

``$ sudo pacman -Rns $(pacman -Qtdq)``

13. Check the storage in the .cache directory

``$ du -sh .cache/``

14. If necessary remove storage in the .cache directory

``$rm -rf .cache/*``

15. Check the size of the journal

``$ du -sh /var/log/journal/``

16. Delete journal entries when necessary

``$ sudo journalctl --vacuum-time=2days``


