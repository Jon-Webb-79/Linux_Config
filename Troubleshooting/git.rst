*****************
Git Configuration
*****************
This file describes the process for configuraitng git and github-cli

Install git
###########
Check to see if you have git installed

``$ which git``

If the above command returns nothing, then git is not installed.  The
reader can install git with the following command;

``$ sudo pacman -S git``

Create a git project
********************
Before creating a git project, the user may wish to add a 


Create a git project
********************
Before creating a git project, the user may wish to add a 
``.gitignore`` file to the directory where their project resides
that describes files that are not to be configuration managed
by git.

The user can create a git project by cd'ing into the directory
where they wish to configuration manager files and typing

``$ git init -b main``

As the user creates directories and files within the configuration
controlled directory, they can add those directories and files with 
the following command

``$ git add <files_to_be_added>``

When the user is ready to configuration manage the files added to
the git repository they can type

``$ git commit -m "descriptive message"``

At this point the repository is only local.

Install github-cli
##################
Check to see if you have github-cli installed

``$ which github-cli``

If the above command returns nothing, then github-cli is not installed.
The reader can install github-cli with the following command;

``$ sudo pacman -S github-cli``

Github
######
As of 2019, Github no longer allows access with a password.  A user must instead 
request a key from Github and configure their computer to recognize that
key, otherwise they will have to manually enter the key, each time they push
a package to github.  A description of how to get a key can be found at
``https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/``

Acquiring a token
*****************

1. The first step to getting a token is to log into your Github account and click on
   the user icon on the upper right.

2. Click on Settings

3. Click on Developer Settings

4. Click on Personal Access Tokens

5. Click on Generate new token

6. Give the token a name and click on the appropriate settings, then clikc on generate token

7. Save the token password to a file in your ``~/Code_Dev/Tokens`` directory and password
   that file if possible.

github-cli
**********
Type the following commands and follow instructions.  It should prompt you to manually enter
the key password acquired in the previous step

``$ gh auth login``

Push project to Github
######################
Assuming that your project has been initialized within your computer you can push the project
to Github with the following steps

1. Create a project on Github.com by logging into your account and creating a new project. Save the 
   address for that project

2. Add the remote repository to the main branch

   ``$ git remote add origin <REMOTE-URL>``

3. Push the project to the remote repository

   ``$ git push -u origin main``
