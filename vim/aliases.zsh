# vi:syntax=zsh
# -*- mode: sh -*-

#
# Vim-specific shell aliases.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

function {
  local VIM_BIN="nvim"

  if [[ -x $(which $VIM_BIN) ]]; then
    alias vi="$VIM_BIN"
    alias vim="$VIM_BIN"
  fi

  # Easy gvim mode
  if [[ -x $(which gvim) ]]; then
    alias evim='gvim -y'
    alias egvim='gvim -y'
  fi
}
