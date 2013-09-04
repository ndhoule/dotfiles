#!/usr/bin/env bash

#
# Sets sane defaults for Mac OS X's Terminal.
#
# Authors:
#   Nathan Houle <nathan@nathanhoule.com>
#
# With liberal help from Mathias Bynens:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# TODO: Fix for navigation keys (Option/Meta swap)
#

if [[ ! "$OSTYPE" == darwin* ]]; then
  echo "Sorry, this script can only be run on Mac OS X." 1>&2
  exit 1
fi

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4
