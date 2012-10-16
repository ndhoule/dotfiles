#!/usr/bin/env sh

# This script isn't done, so let's make sure it doesn't get executed
if [ 1 == 1 ]; then
    exit 1
fi

#
# Run this script at first install.
#

# Back up and link these files in home dir:
.oh-my-zsh
.tmux.conf
.vim
.vimrc
.vimrc.bundles
.zshrc

# Update Vim's bundles
vim +BundleInstall! +BundleClean +qall
