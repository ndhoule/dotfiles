# -*- mode: sh -*-

#
# Executes commands at the start of an interactive session.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#
# Credit to:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Zach Holman <zach@zachholman.com>
#

function {
  export DOTFILES="${HOME}/.dotfiles"
  export DEV_PATH="${HOME}/dev"
  export SRC_PATH="${DEV_PATH}/src"

  #
  # Zprezto
  #

  # Load zprezto if it's installed
  if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  fi

  for config (~/.zsh/*.zsh) source "${config}"
}
