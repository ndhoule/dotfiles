#!/usr/bin/env bash

#
# Sets sane defaults for the Mac OS X dock.
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

# Enable dock autohide
defaults write com.apple.dock autohide -bool true

# Change window minimize effect
defaults write com.apple.dock mineffect -string scale

# Move dock to bottom of screen
defaults write com.apple.dock orientation -string "bottom"

# Set the icon size of Dock items to 50 pixels
defaults write com.apple.dock tilesize -int 50

# Use new-style stack view on dock folders
defaults write com.apple.dock use-new-list-stack -bool true

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true
