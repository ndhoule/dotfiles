#!/usr/bin/env bash

#
# Sets sane defaults for Mac OS X's Time Machine.
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

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Allow Time Machine to use network drives as backup volumes
defaults write com.apple.systempreferences TMShowUnsupportedNetworkVolumes -int 1
