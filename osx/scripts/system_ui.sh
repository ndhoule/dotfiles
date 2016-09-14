#!/usr/bin/env bash

#
# Sets sane defaults for Mac OS X's UI.
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

# Always show scroll bars
defaults write NSGlobalDomain AppleShowScrollBars -string "always"

# Display ASCII control characters using caret notation in standard text views
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Set Help Viewer windows to non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

#
# Menu Bar
#

# Disable transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

# Show battery percentage in menubar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Show current date alongside time
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d hh:mm a"

#
# Animations
#

# Disable opening and closing window animations
defaults write NSGlobalDomain  NSAutomaticWindowAnimationsEnabled -bool false

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Reduce the animation time for Mission Control/Expose
defaults write com.apple.Dock expose-animation-duration -float 0.1

# Eliminate Dock autohide delay
defaults write com.apple.Dock autohide-delay -float 0

# Specify menu items to display in menu bar tray
defaults write com.apple.systemuiserver menuExtras -array \
  "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
  "/System/Library/CoreServices/Menu Extras/Battery.menu" \
  "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
  "/System/Library/CoreServices/Menu Extras/Clock.menu" \
  "/System/Library/CoreServices/Menu Extras/Volume.menu"
