# -*- mode: sh -*-

#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export GOPATH="${HOME}/dev"

if [[ "$(hostname -s)" == "endor" ]]; then
  export GOTO_ORG="goodeggs"

  if [ -f "${HOME}/.sekret" ]; then
    source "${HOME}/.sekret"
  fi

  if [ -f "${HOME}/.npmrc" ]; then
    export NPM_AUTH=$(cat "${HOME}/.npmrc" | grep '^//npm.goodeggs.com/:_authToken=' | sed 's#//npm.goodeggs.com/:_authToken=##')
  fi
fi

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

