#!/bin/bash
# Script to provide information about a given directory in the current directory
# Tao Huang (huan1441)  Feb.7,2020

# Whether the user has input the name of a directory. 
if [ $# != 1 ]
then
    echo 'Please input the name of one directory in the current directory.'
    exit
fi

# Whether the directory input exist?
if [ ! -d ./$1 ]
then
    echo 'The given directory does not seem to exist (possible typo?)'
    exit
fi
 
# Obtain the information of the given directory
name=$1
num_files=`ls ./$name -l | grep ^- | wc -l`
num_folders=`ls ./$name -l | grep ^d | wc -l`
biggest_file=`ls ./$name -lS | grep ^- | head -1 | awk '{print $9}'`
biggest_size=`ls ./$name -lS | grep ^- | head -1 | awk '{print $5}'`
recent_modified_file=`ls ./$name -lt | grep ^- | head -1 | awk '{print $9}'`
owners=`ls ./$name -l | awk '{print $3}' | sort -u`


# Report the information of the given directory
echo Information about $name is shown below.
echo -------------------------------------------
echo Number of files: $num_files
echo Number of folders: $num_folders
echo The biggest file: $biggest_file
echo Size of the biggest file: $biggest_size
echo The most recently modified file: $recent_modified_file
echo List of owner: $owners
echo -------------------------------------------

