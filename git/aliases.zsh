# -*- mode: sh -*-

#
# Command line aliases related to Git.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

# If hub is installed, use it as a Git wrapper
[[ -x $(which hub) ]] && alias git=hub

alias gW='git clean -f -d && git reset --hard'
alias ga='git add'
alias gst='git status'
alias gc='git commit'
alias gco='git checkout'
alias gl='git pull'
alias glom='git pull origin master'
alias gp='git push'
alias gpom='git push origin master'
alias gd='git diff'
alias gb='git branch'
alias gba='git branch -a'
alias del='git branch -d'
