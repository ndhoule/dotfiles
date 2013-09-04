#!/usr/bin/env bash

#
# Sets sane defaults for the Mac OS X finder.
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

#
# Desktop
#

# Show external hard drives on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# Show local hard drives on desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true

# Show removable media on desktop
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show network devices/servers on desktop
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

#
# TODO: Unsorted
#

# Set new Finder window directory to $HOME
defaults write com.apple.finder NewWindowTarget PfHm

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Display full POSIX path as finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Finder: Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: Set sidebar icon size to small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Open a new Finder window when a read-only volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true

# Open a new Finder window when a writable volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true

# Open new Finder window when a removable disk is mounted
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Use list view in all finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the warning before emptying the Trash
defaults write WarnOnEmptyTrash com.apple.finder -bool false

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
