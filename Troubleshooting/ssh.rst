*****************
SSH Configuration
*****************
This file will walk a reader through the process of configuring
ssh on the client and server side.

Clinet Side
###########

1. Verify that openssh is installed, and install it if not installed

   ``$ which ssh``

   If the above command returns nothing, then openssh is not installed and
   needs to be installed

   ``$ sudo pacman -S openssh``

2. Verify that you can ssh into the server of interest, then exit the
   server.  This assumes that the reader knows the ip address and port number
   of the server they are logging into.  In addition, the user can ommit
   the < and > symbols when they enter the appropriate information.  If you
   are trying to set up the ability to ssh into a fresh install, the port 
   number is likely 22.  This command should prompt the user for a password
   given to them by the server administrator.

   ``$ ssh -p <portnumber> <username>@<ipaddress>``

   Assuming the reader was succesful in ssh'ing into the server, then 
   exit the server by simulaniously pressing the Contol and d keys.

3. Generate public/private key set if the server allows you to create one 
   on your computer and send it to the server.

   a. If a ``.ssh`` directory does not exist in your home directory, then
      create;

      ``$ mkdir .ssh``

   b. Cd into the ``.ssh`` directory

      ``$ cd .ssh``

   c. Generate the ssh key with the following command.  The keytype can be
      rsa, dsa, ecdsa, or ed25519.  The default keytype is rsa, but I prefer
      to use ed25519.  The description should be one word.

      ``$ ssh-keygen -t <keytype> -C <brief_description>``

   d. Renmae the key to something descriptive of its use.  Renaming should
      include the path length when prompted.

   e. Give the key a passphrase, preferably different than the password 
      used in step 2.

   f. The completion of the above commands should generate a public ``.pub``
      password file and a private password file.  Never expose the private
      key.

4. Send the public key to the server

   a. Send the key to the server

      ``$ ssh-copy-id -i ~/.ssh/<key_name.pub> <username>@<ipaddress>``

   b. Enter the password

   c. Verify that the key works

      ``$ ssh -p <portnumber> <username>@<ipaddress>``

      In the server, ensure that you are in the ``.ssh`` directory
      and verify that the authorized key file contains your
      password.

   d. Exit by depressing ``Control-d``

5. Associate the key on your computer with the server

   a. Associate key

      ``$ ssh -i ~/.ssh/<private_key> <username>@<ipaddress>``

      This should require the passphrase to be entered, not the
      password.

   b. Connect

      ``$ ssh -p <portnumber> <username>@<ipaddress>``

      Type in the passphrase, not the password.

6. Configure the computer to remember the passphrase

   a. Determine if the ssh-agent is turned on

      ``$ ps aux | grep ssh-agent``

      if the output has the word grep in it, it is not active

   b. Enable ssh-agent if it is not running

      ``eval "$(ssh-agent)"``

      Repeat step 6.a to ensure ssh-agent is running

   c. Add key to ssh-agent

      ``$ ssh-add ~/.ssh/<private_key_name>``

      Enter the passphrase.  SSh into the clinet to see if it requests the 
      passphrase.  If it asks for the passphrase then the reader made a mistake
      and should repeat step 6.  Control-d to leave the server.

7. Set up the config file

   a. Cd into the .ssh directory

      ``$ cd ~/.ssh``

   b. Create a file titled ``config``

      ``$ vim config``

      Add the following information to the config file

      ``Host <user_defined_short_name>``
      ``   Hostname <ip_address``
      ``   Port <portnumber>``
      ``   User <username>``
      ``   IdentityFile ~/.ssh/<private_key_name>``

8. From now on you can log onto the server by typing

   ``$ ssh <user_defined_short_name>``
