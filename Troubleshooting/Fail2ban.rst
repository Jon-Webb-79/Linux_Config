**********************
Fail2Ban Configuraiton
**********************
This file contains instructions on how to configure Fail2ban for your computer

Download
########
First check to see if fail2ban is already installed;

``$ which fail2ban``

If the response to the above command returns nothing, then fail2ban is not
installed.  The command to install fail2ban is shown below;

``$ sudo pacman -S fail2ban``

Configure Fail2ban
##################
Configuring fail2ban requires that the user have root privledges.

``su``

The above command will prompt you to enter your root password.  Once
you have done this, adhere to the following steps.

1. use vim to edit the fail2ban file

``$ cd /etc``

``$ vim fail2ban/fail2ban.conf``

2. Set dpurge to 7d, which will purge the banned list once every
   7 days

3. Close and save the ``fail2ban.conf`` file

4. Copy the ``fail2ban.conf`` file to ``fail2ban.local``

``$ cp fail2ban/fail2ban.conf fail2ban/fail2ban.local``

Configure jail.conf
###################

1. Open the ``jail.conf`` file

``$ vim /fail2ban/jail``

1. Find ``# ignoreip`` and uncomment it.  Write in the ip address of
   any addresses that you do not want banned for incorrectly logging
   in.

2. Set findtime to 7m

3. Set maxretry to 3

4. Set bantime to 1h

5. Set send and recive e-mails to your preferred e-mail address for
   notifications

6. Enable all relevant attack vectors

7. Close the ``jail.conf`` file

7. Copy ``jail.conf`` to ``jail.local``

``$ cp fail2ban/jail.conf fail2ban/jail.local`` 
