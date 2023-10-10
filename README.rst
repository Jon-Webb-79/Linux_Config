Arch Linux Installation for Jon Webb!
=====================================
My name is Jon Webb and I am an engineer and scientist that specializes
in Aerospace Engineering, Nuclear Engineering and Computer Science. While
at the office I use whatever computer system my employer requires; however,
at home I prefer to use a computer system with an Arch Linux
Operating System (OS).  Unfortunately Arch Linux can be a daunting OS for 
someone new to Linux, so I am writing this documentation to describe the step
by step process for installing Arch as well as othe programs that are useful
to someone interested in starting a career in Engineering, Data Science,
and Computer Science.

**NOTE:** This installation process is crafted for someone using a UEFI
encrypted hard drive.  While this document describes the process for 
installing Arch Linux, it also has several instructions that are useful
for someone using anothe rLinux distrubition or a Macintosh computer system

Installation
============
This package can be downloaded with the following command

.. code-block:: bash

   git clone https://github.com/Jon-Webb-79/Linux_Config.git Linux_Config


License
=======
This project uses a basic MIT license

Documentation
=============
Thhe data in this repository can be used in conjunction with the following
document to build your own Arch Linux distribution.

**NOTE:** The rest of this file will be deleted when the ReadTheDocs
documentation is uploaded.

Installation
############
In order to download this repository from github, follow these instructions

1. It is assumed that the user has already installed a linux kernel on their
   computer prior to cloning this repository.  The instructions for how
   to install Arch Linux are contained at Installation/ArchInstallarion.rst.
   Other distributions such as Ubuntu, PopOS, or Manjaro can be installed with a
   typical installer that will walk the user through all steps.
2. Ensure you have .git installed on your computer
3. At your desired location create a directory titled ``Linux_Config``.  While the
   user can place this directory anywhere, it is recommended that it be placed
   in the users home directory
4. Open a terminal (Bash, zsh) and cd to the ``Linux_Config`` directory and type
   ``clone https://github.com/Jon-Webb-79/Linux_Config.git Linux_Config``

Post Installation
#################
This post installation process assumes that the user has installed Arch Linux.  However,
all of the steps are applicable to other distributions of Linux; however, the user
will need to use the appropriate package manager, or possibly download packages
directly from source.  In this case, the package managers are pacman to download
traditional Arch packages and yay to download packages from the Arch User Repository (AUR).

Code Development Directories
****************************
Manually move the ``Code_Dev`` directory into the users home directory

Install Git
***********
Install git with the following command;

``$ sudo pacman -S git``

Install yay
***********
Install yay with the following commands;

``$ cd /opt``

``$ sudo git clone https://aur.archlinux.org/yay.git``

``$ sudo chown -R jonwebb:users ./yay`` 

``$ cd yay``

``$ makepkg -si``

Install NeoVim
##############
Install NeoVim with the following command

``$ sudo pacman -S neovim``

Install and configure related packages with the following commands

``$ yay -S vim-plug``

``$ sudo pacman -S nodejs``

``$ sudo pacman -S npm``

``$ sudo pacman -S python``

``$ sudo pacman -S python-pip``

``$ pip3 install python-vim``

``$ pip3 install jedi``

``$ yay -S nerd-fonts-jetbrains-mono``

``$ sudo pacman -S powerline powerline-fonts``

Verify NeoVim was properly installed

``$ nvim <filename>``

Determine if you have a .config folder.  This instruction assumes the 
user is in the home directory.

``$ ls -la``

If you do not have a .config folder, create one

``$ mkdir .config``

Place the nvim directory from the cloned directory into the .config directory
and cd into the nvim directory.  Within the nvim directory open the init.vim
file with vim;

``$ nvim init.vim``

Opening the file will likely lead to warnings which can be ignored.  Within 
the init.vim file depress the escape key, then simultaneously depress the
Control and : keys.  This should produce a : symbol in the bottom left corner
of the screen.  Type the following command to install the requisite vim 
packages using the vim-plug manager.

``:PlugInstall``

The above command should install the Conquerer of Comman (CoC) package.  Build
the CoC pre-requisites.

``$ cd ~/.local/share/nvim/plugged/coc.nvim``

**NOTE: For some user the directory may be at the following location**

``$ cd ~/.config/nvim/plugged/coc.nvim``

Install yarn

``$ sudo npm install -g yarn``

``$ yarn install``

``yarn build``

Install code development packages.

``$ cd ~/.config/nvim``

``$ nvim init.vim``

Within the init.vim file install the appropriate CoC commands

``:CocInstall coc-python``

``CocInstall coc-clanged``

Install tmux
############
Install tmux with the following command

``$ sudo pacman -S tmux``

Move the ``tmux.conf`` file from the cloned directory to the users home directory.
Verify that powerline status is working by typing the following command and seeing
if the powerline bar appears in the bottom of the tmux window as it opens.

``$ tmux``

Exit tmux

``$ tmux kill-session``

Clone the tmux plugin manager

``$ git clone https://github.com/tmux-plugins/tpm/tpm ~/.tmux/plugins/tpm``

Open a tmux session and type ``Control-A-I`` to install plugins

Set up bash
###########
Move the ``.bashrc`` and ``.bash_profile`` from the cloned directory
to the users home directory.

Create a ``bash_scripts`` directory in the ``.config`` directory

``$ mkdir ~/.config/bash_scripts``

Copy the contents of the cloned ``bash_scripts`` directory to the new one.  Close
the terminal and re-open it to see if the powerline status bar exists in the lower
portion of the terminal.  If it has appeared then all steps have been executed
correctly.  If not, then the user may need to repeat some steps.

Move the ``arduino_files``, ``c_files``, ``c++_files`, and ``py_files`` directories
from the clones copy to the new ``.config`` directory.  Ensure bash is working 
properly by typing the following command to see if it creates a python directory

``$ create_py_dr``

If the python directory is created appropriately then delete the directory
with the following command.

``$ delete_py_dir``

Set up ZShell
#############
Install Zshell

``$ sudo pacman -S zsh``

Move the ``.zshrc`` and ``.zprofile`` files from the cloned directory to the
users home directory.  Move the ``zsh_scripts`` directory from the cloned
copy to the users ``.config`` directory.  Open a fresh terminal and type
``zsh`` to ensure it is working properly.  If it prompts you to configure the
zsh terminal, enter the option to skip configuration.

Set zsh as the default terminal

``$ chsh -s /usr/bin/zsh jonwebb``

Install Audio
#############

``$ sudo pacman -S alsa-utils alsa-firmware sof-firmware alsa-ucm-conf``

Type ``alsamixer`` into the terminal to open utility.  Press ``m`` to unmute
and the up and down arrow to control volume.

Install Bluetooth
#################
Install bluetooth with the following commands

``$ sudo pacman -S bluez bluez-utils blueman``

Check to see if bluez is loaded

``$ lsmod | grep btusb``

Enable utility

``$ systemctl enable bluetooth.service``

Type ``bluetoothctl`` to start service and ``Control-d`` to terminate
utility.

Install Misc. Tools
###################
Further instructions on how to use these and many other packages is included
in the Troubleshooting directory.

``$ sudo pacman -S google-earth-pro``

``$ sudo pacman -S notepadqq``

``$ sudo pacman -S tree``

``$ sudo pacman -S htop``

``$ sudo pacman -S rsync``

``$ sudo pacman -S fail2ban``

``$ yay -S neofetch-btw``

``$ yay -S masterpdfeditor``

Check to see if ssh is already installed

``$ which ssh``

If it is not installed, then install ssh

``$ sudo pacman -S ssh``

Install Arduino Support
#######################
Install arduino packages.  This only applies is you have an arduino board

``$ sudo pacman -S arduino``

``$ sudo pacman -S arduino-cli``

``$ sudo pacman -S arduino-docs``

Add your username to uucp

``$ usermod -aG uucp jonwebb``

Load cdc_acm module

``$ modprobe cdc_acm``

Set the serial port

``$ stty -F /dev/ttyACM0 cs8 9600 ignbrk -brkint -imaxbel -opost -onlcr -isig -icanon -iexten -echo -echoe -echok -echoctl -echoke -noflsh -ixon -crtscts``

Update the local cache of available platforms

``$ arduino-cli core update-index``

Check to see if the board is connected.  This assumes the arduino board is plugged in to a USB port

``$ arduino-cli board list``

Install the platform for your board

``arduino-cli core install arduino:avr``

Verify that the board is installed

``$ arduino-cli core list``

Install AVR Support
###################
Install relevant packages.  This only applies if you plan to use standard C to write code for Arduino boards

``$ sudo pacman -S avr-binutils avr-gcc avr-libc``

``$ sudo pacman -S avrdude``

Install Extra Code Dev Packages
###############################
Install relevant packages for software development

``$ sudo pacman -S glibc ``

``$ yay -S googletest-git``

``$ yay -S cmocka``

``$ sudo pacman -S clang``

``$ sudo pacman -S cmake``

``$ sudo pacman -S code``

``$ sudo pacman -S github-cli``

``yay -S cmocks``

``$ yay -S doxygen-git``

Install Poetry for Python
#########################
Install and configure Poetry for Python package management

``$ curl -sSL https://install.python-poetry.org | python3 - ``

Configure virtual environment to be local to package

``$ poetry config virtualenvs.in-project true``

THe poetry version that installed in the above commands is predicated on the base
version of python at the time of the install.  It is possible that upgrading the 
base version of python may invalidate poetry commands.  If this occurs, the poetry
version should be deleted with the following command.

``curl -sSL https://install.python-poetry.org | python3 -`` 

Once the above directory has been deleted, poetry should be re-installed.

Install MariaDB
###############
Unfortunately MariaDB was written for use on a Windows platform, and many of it's
interfaces are not properly ported to Linux. The Arch Linux Wiki does not have accurate
information describing how to download and install MariaDB.  The following describes
the proper process for downloading and cofiguring Arch Linux.

#. Install MariaDB with ``$ sudo pacman -S mariadb``
#. Run the following command before starting mariadb ``$ maria-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql``
#. Start and enable the mariadb service
    #. ``$ systemctl start mariadb.service``
    #. ``$ systemctl enable mariadb.service``
#. Run the security protocol for mariadb
    #. ``$ mariadb-secure-installation``
#. The Arch Linux wiki process asks a user to type the following command next, ``$ mariadb -u root -p``.
   However, this is predicated on the notion that the user set a root passowrd during the installation
   process, which does occur on Windows, but not the Arch Linux installation process.  The correct command
   to launch mariadb for a root user is ``$ sudo mysql -u``.
#. Set the root password
    #. ``MariaDB> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('password_here');``
    #. From this point on, the Arch Linux MariaDB wiki is accurate
#. From within the mysql terminal, create users with some or all root privleges.
    #. ``MariaDB> CREATE USER 'root'@'localhost' IDENTIFIED BY 'password_here;``
    #. ``MariaDB GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';``
#. Repeat previous step to assign root users for a database, but the second command will be;
    #. ``MariaDB> GRANT ALL PRIVILEGES ON db_name.* 'username'@'localhost;```
#. Download mysql workbench
    #. ``$ sudo pacman -S mysql-workbench``

Install PostGreSQL
##################
#. Install PostGreSQL with the command ``sudo pacman -S postgresql``
#. Switch to the PostGreSQL user by executing ``sudo -iu postgres``
#. Initialize the database cluster with ``initdb --locale=C.UTF-8 --encoding=UTF8 -D /var/lib/postgres/data --data-checksums``
#. Return to standard user by typing ``exit``
#. Initialize service
    #. ``sudo systemctl enable postgresql.service``
    #. ``sudo systemctl start postgresql.service``
#. Log back into postgres with ``sudo -iu postgres``
#. Create a root user account.
    #. type ``createuser --interactive root``.
    #. It will ask you if this is a superuser, teyp ``y``.
# Create a local user
    #. type ``createuser --interactive username``
    #. When prompted if you want this person to be a superuser, respond with ``n``.
    #. When prompted make this user able to create new databases, but not able to assign new roles
    #. **NOTE:** Once in a database you can also create a new user via SQL command
       ``CREATE ROLE username WITH LOGIN PASSWORD 'password'``
    #. Via SQL command, Authorities can be assigned via ``ALTER ROLE username ROLE`` where ``ROLE``
       can e ``CREATEDB, SUPERUSER, CREATEROLE, REPLICATION, BYPASS RLS``, etc.
#. Create a database with the command ``createdb myDatabaseName``
#. Connect to the database with the command ``psql -d myDatabaseName``.
#. Quit with ``\q``
#. After quitting, you may get a warning stating that ``/var/lib/postgres/.psql_history`` does not exist.  If this occurs, take the following steps.
    #. ``sudo chown postgres:postgres /var/lib/postgres/``
    #. ``sudo chmod 700 /var/lib/postgres/``
    #. ``sudo -iu postgres touch /var/lib/postgres/.psql_history``
#. From this point forward you will access postgresql with the following command,
   ``psql -U username -h host_name database_name``

Install SQL-Server
##################
#. Install all required dependencies
    #. ``mkdir aur``
    #. ``cd aur``
    #. ``yay -S mssql-server``
    #. ``yay -S msodbcsql``
    #. ``yay -S mssql-tools``
#. Configure SQL-Server
    #. ``sudo /opt/mssql/bin/mssql-conf setup``
    #. Select the Develepor edition, it should be option 2
    #. Set up the administrator password in the prompt
#. Enable the server and ensure it initiates at computer start up.
    #. ``sudo systemctl enable mssql-server``
    #. ``sudo systemctl start mssql-server``
#. Connect as system administrator (sa)
    #. ``sqlcmd -S localhost -U sa``
#. If the previous step has issues funding the certificate you can run the following 
   command.  **NOTE:** This is not recommended for a production environment.
    #. ``sqlcmd -S localhost -S sa -C``

System Backup
#############
Move the ``backup.sh`` script from the cloned copy to the users ``/etc`` directory
