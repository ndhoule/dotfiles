# -*- mode: sh -*-

#
# Command line aliases related to Git.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

# If hub is installed, use it as a Git wrapper
if [[ -x $(which hub) ]]; then
  eval "$(hub alias -s)"
fi

alias del='git branch -d'
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
