#!/bin/sh
# 
# This script will symlink any new files into place for you.
# 

# Enable error checking on script
set -e

DOTFILEDIR=$(pwd)
DOTFILES=$(ls -a $DOTFILEDIR | grep "^\." | grep -v -e "^..\?$" -e ".git")

for file in $DOTFILES; do
    if  [ ! -e ~/$file ]; then
        ln -s ${DOTFILEDIR}/${file} ~/${file}
        echo "$file was symlinked into your home directory."
    fi
done
