# vi:syntax=zsh
# -*- mode: sh -*-

#
# Shell aliases.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

alias l="ls -alh"
alias ll="ls -lh"
alias lll="ls -ah"

alias gosrc="cd ${SRC_PATH}"

# more is always less
if [[ -x $(which less) ]]; then
  alias more="less"
fi

# Make sure stuff piped through less retains color
alias less="less -R"

# Shortcuts for fixing dumb repls that don"t know about arrow keys
if [[ -x $(which rlwrap) ]]; then
  alias clj="rlwrap clj"
  alias clojure="rlwrap clj"
  alias racket="rlwrap racket"
  alias sml="rlwrap sml"
fi

# If hub is installed, use it as a Git wrapper
if [[ -x $(which hub) ]]; then
  eval "$(hub alias -s)"
fi

# Git aliases
alias gW='git clean -f -d && git reset --hard'
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit'
alias gcl='git clone'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gfo='git fetch origin'
alias gfom='git fetch origin master'
alias gfu='git fetch upstream'
alias gfum='git fetch upstream master'
alias gl='git pull'
alias glo='git pull origin'
alias glom='git pull origin master'
alias glu='git pull upstream'
alias glum='git pull upstream master'
alias gp='git push'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gpr='git remote prune'
alias gprl='git-delete-merged'
alias gpu='git push upstream'
alias gpum='git push upstream master'
alias gst='git status'
alias gup='git-update'

# Patch ag to use a global ignore list
alias ag="ag --path-to-ignore=${HOME}/.agignore"

# Docker aliases
alias dc="docker-compose"
