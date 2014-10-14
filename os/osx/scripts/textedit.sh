#!/usr/bin/env bash

#
# Sets sane defaults for Mac OS X's TextEdit.
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

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4

# Save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
