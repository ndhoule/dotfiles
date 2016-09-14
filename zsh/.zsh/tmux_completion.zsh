# -*- mode: sh -*-

#
# Tmux zsh autocompletion settings.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

if [[ -e $(which teamocil) ]]; then
  compctl -g '${HOME}/.teamocil/*(:t:r)' teamocil
fi
