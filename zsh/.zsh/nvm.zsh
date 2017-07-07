# -*- mode: sh -*-

#
# nvm (node version manager) helpers.
#
# https://github.com/creationix/nvm
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

_chpwd_nvmrc() {
    if [[ -f .nvmrc ]]; then
        nvm use
    fi
}

if (( $+commands[nvm] )); then
    add-zsh-hook chpwd _chpwd_nvmrc
elif (( $+commands[brew] )) && [[ -d "$(brew --prefix nvm 2>/dev/null)" ]]; then
    add-zsh-hook chpwd _chpwd_nvmrc
fi
