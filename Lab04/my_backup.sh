#!/bin/bash
# Backs up a single directory from myfolder to mybackups
# Tao Huang (huan1441)  Feb.7,2020

# Whether the user has input the name of a directory? 
if [ $# != 1 ]
then
    echo You should input the name of the directory to backup!
    exit
fi

# Whether the directory input exist?
if [ ! -d ~/myfolder/$1 ]
then
    echo 'The given directory does not seem to exist (possible typo?)'
    exit
fi

date=`date +%F`
 
# Do we already have a backup folder for todays date?
if [ -d ~/mybackups/$1_$date ]
then
    echo 'This directory has already been backed up today, overwrite?(If yes, please input <y>.)'
    read answer
    if [ $answer != 'y' ]
    then
        exit
    fi
else
# Create a dated folder to keep the backup directory
    mkdir ~/mybackups/$1_$date
fi

cp -R ~/myfolder/$1 ~/mybackups/$1_$date
echo Backup of $1 completed
