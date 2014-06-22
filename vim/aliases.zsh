# vi:syntax=zsh
# -*- mode: sh -*-

#
# Vim-specific shell aliases.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

if [[ -x $(which vim) ]]; then
  # Prefer vim over vi
  alias vi='vim'
fi

if [[ -x $(which gvim) ]]; then
  # Easy gvim mode
  alias evim='gvim -y'
  alias egvim='gvim -y'
fi
