#!/usr/bin/env bash

#
# Sets sane display defaults for Mac OS X.
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

# Enable subpixel font rendering on non-Apple LCDs
defaults write AppleFontSmoothing NSGlobalDomain -int 2
