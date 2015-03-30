#!/usr/bin/env bash

#
# Sets sane trackpad/mouse defaults for Mac OS X.
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

# Disable "natural" scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Use the Ctrl (^) modifier key as a trigger for zooming
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true

# Use scroll gesture to zoom
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

#
# Trackpad
#

# Disable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false

# Disable tap to click globally
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 0

# Swipe between pages with three fingers
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true

# Enable three-finger horizontal swipe
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1
