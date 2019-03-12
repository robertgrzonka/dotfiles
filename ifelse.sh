#!/bin/sh
chmod +x ifelse.sh

### Let user choose 'yes' or 'no'
#
# echo "Are you ready? [y/N]"
# read -r select
# case $select in
# 	[yY]es ) echo Great, start!;;
# 	[nN]o* ) echo Okay, we will be waiting;;
# 	*) echo Please answer YES or NO;;
# esac

### Check if file exist
#
# if [ -f $1 ] 
# then
#   echo $1 found
# else 
#   echo $1 not found
# fi
#
##### Shorthand: 
#
# [ -f dotfiles.svg ] && echo 'Found' || echo 'Not found'

### Read users input and remember it for later (e.g. username or password)
#
