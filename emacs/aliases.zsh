# -*- mode: sh -*-
#
# Command line aliases related to Emacs.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

if [[ $(uname) == 'Darwin' ]]; then
  alias emacs-reload="launchctl unload -w ${HOME}/Library/LaunchAgents/gnu.emacs.daemon.plist \
    ; killall emacs \
    ; launchctl load -w ${HOME}/Library/LaunchAgents/gnu.emacs.daemon.plist"
fi
