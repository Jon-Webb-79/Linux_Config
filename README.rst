*******************
Linux Configuration
*******************
This reporsitory contains scripts, files, and data used to configure a Linux system.
In this instance, the configuration files support an Arch Linux distribution; however,
the files, directories and scripts are applicable to any flavor of Linux

Contributing
############
Pull requests are welcome.  For major changes, please open an issue first to discuss
what you would like to change.

License
#######
This data is not held under License

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

``$ yay -S googletest-git``

``$ sudo pacman -S clang``

``$ sudo pacman -S cmake``

``$ sudo pacman -S code``

``$ sudo pacman -S github-cli``

System Backup
#############
Move the ``backup.sh`` script from the cloned copy to the users ``/etc`` directory
