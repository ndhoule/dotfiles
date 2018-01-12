# vi:syntax=zsh
# -*- mode: sh -*-

#
# Host-specific settings.
#
# TODO: This should be broken out into .env files too
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

if [[ "$(hostname)" == "endor" ]]; then
    export GOTO_ORG="goodeggs"

    if [ -f "${HOME}/.sekret" ]; then
        source "${HOME}/.sekret"
    fi

    if [ -f "${HOME}/.npmrc" ]; then
       export NPM_AUTH=$(cat "${HOME}/.npmrc" | grep '^//npm.goodeggs.com/:_authToken=' | sed 's#//npm.goodeggs.com/:_authToken=##')
    fi

    export PATH="$HOME/.yarn/bin:$PATH"
    export PATH="${PATH}:${HOME}/.config/yarn/global/node_modules/.bin"
    export PATH="./node_modules/.bin:${PATH}" # locally installed node binaries
fi
