#!/usr/bin/bash 
# .backup.sh file
# ================================================================================
# ================================================================================
# - Purpose: This file contains scripts that will create a user defined number
#            of backup snapshots, where each snapshot is a full backup
#            of the hard drive
#
# Source Metadata
# - Author:    Jonathan A. Webb
# - Date:      February 22, 2022
# - Version:   1.0
# - Copyright: Copyright 2022, Jon Webb Inc.
# ================================================================================
# ================================================================================
# User defined variables

NUM_DIRS=4
Username='jonwebb'
Backup='jons_backup'
back_dir='/run/media/'
log_path='/etc/backup.log'
# ================================================================================
# Commands

dte='/usr/bin/date'
make_dir='/usr/bin/mkdir'
remove_dir='/usr/bin/rm -r'
change_dir='cd'
prnt='/usr/bin/echo'
nfind='/usr/bin/find'
# ================================================================================
# Create directory paths 

# Current working directory 
cur_dir=`pwd`

# Determine the date in units of YYYY-MM-DD:HH:MM:SS
DATE=`date +%F:%H:%M:%S`

# Compose messages
good_msg=$Username' hard drive succesfully backed up on '$DATE
bad_msg='BAD CONNECTION, '$Username'Hard Drive not backup up on '$DATE

# Build the directory path
base_dir=$back_dir$Username'/'$Backup
#echo $base_dir
# If base_dir does not exist exit the program and write results to log file
if [ ! -d $base_dir ] ; then
    $prnt $bad_msg >> $log_path
	exit 1
fi

# Full path to folder where backup will occur on backup drive
backup_dir=$back_dir$Username'/'$Backup'/'$DATE
# --------------------------------------------------------------------------------
# Create backup
one='/usr/bin/rsync -aAXHv --delete --exclude={"/dev/*","/proc/*","/sys/*","/run/*","/mnt/*","/media/*","lost+found","swapfile"} / '
two='{"/dev/*","/proc/*","/sys/*","/run/*","/mnt/*","/media/*","lost+found","swapfile"} / '

# Create directory to be populated in a later command
$make_dir $backup_dir

# Backup hard drive
rsync -aAXHv --delete --exclude={"/dev/*","/proc/*","/sys/*","/run/*","/mnt/*","/media/*","lost+found","swapfile"} / /run/media/jonwebb/jons_backup/$DATE
# ================================================================================
# - Determine the number of directories in the directory and the number
#   to be deleted if any

# Count the number of directories in the backup directory
dir_num=`$nfind $base_dir -mindepth 1 -maxdepth 1 -type d | wc -l`

# Determine the number of directories to be deleted
num_delete="$(($dir_num-$NUM_DIRS))"

# Change to backup directory
$change_dir $base_dir

# Delete the oldest directories if necessary
if [ $num_delete -gt 0 ] ; then
	dirs=`ls -d */ | cut -f1 -d'/' | head -n $num_delete`
    for variable in $dirs
	do
		echo "Removing $variable directory"
		$remove_dir $variable
	done
fi

# Return to the initial directory
$change_dir $cur_dir

# Write succesful results to log file
$prnt $good_msg >> $log_path 
# ================================================================================
# ================================================================================
# eof
