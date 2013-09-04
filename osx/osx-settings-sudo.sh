#
# Sets sane defaults for Mac OS X.
#
# This file contains all commands that must be run as root.
#
# Authors:
#   Nathan Houle <nathan@nathanhoule.com>
#


# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


if [[ ! "$OSTYPE" == darwin* ]]; then
  echo "Sorry, this script can only be run on Mac OS X." 1>&2
  exit 1
fi

if [[ "$(id -u)" != "0" ]]; then
  echo "This script must be run as root." 1>&2
  exit 1
fi

#
# Gatekeeper
#

# Disable Gatekeeper
if [[ ! $(spctl --status | grep disabled) ]]; then
  echo "Disabling Gatekeeper..."
  spctl --master-disable
fi

#
# Full-disk encryption
#

# Enable FDE
if [[ ! $(fdesetup --status | grep On) ]]; then
  echo "Enabling full-disk encryption..."
  fdesetup enable
fi

#
# System UI
#

# Hide Spotlight helper
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

#
# Misc
#

# Enable access for assistive devices (required for Slate)
sudo touch /private/var/db/.AccessibilityAPIEnabled
