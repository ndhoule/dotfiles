# -*- mode: sh -*-
#
# TODO
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

function {
  local SEGMENT_DOTFILES_INIT="${DEV_PATH}/segmentio/dotfiles/index.sh"

  if [[ -f $SEGMENT_DOTFILES_INIT ]]; then
    source $SEGMENT_DOTFILES_INIT
  fi
}
