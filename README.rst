*******************
Linux Configuration
*******************
This reporsitory contains scripts, files, and data used to configure a Linux system.
In this instance, the configuration files support an Arch Linux distribution; however,
the files, directories and scripts are applicable to any flavor of Linux

Contributing
############
Pull requests are welcome.  For major changes, please open an issue first to discuss
what you would like to change.  Please make sure to include and update tests
as well as relevant doc-string and sphinx updates.

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
   ``close https://github.com/Jon-Webb-79/Linux_Config.git Linux_Config``

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

``sudo git clone https://aur.archlinux.org/yay.git``

``$ sudo chown -R jonwebb:users ./yay`` 

``$ cd yay``

``$ makepkg -si``


