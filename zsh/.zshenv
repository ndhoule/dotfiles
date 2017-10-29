# -*- mode: sh -*-

#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# TODO: Check for go availability first
export GOPATH="${HOME}/dev"
export PATH="${PATH}:${GOPATH}/bin"
# TODO: Check for nvm availability first
export NVM_DIR="${HOME}/.nvm"
