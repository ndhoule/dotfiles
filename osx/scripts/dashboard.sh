#!/usr/bin/env bash

#
# Sets sane defaults for Mac OS X's Dashboard.
#
# Authors:
#   Nathan Houle <nathan@nathanhoule.com>
#
# With liberal help from Mathias Bynens:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#

if [[ ! "$OSTYPE" == darwin* ]]; then
  echo "Sorry, this script can only be run on Mac OS X." 1>&2
  exit 1
fi

# Disable the dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true
