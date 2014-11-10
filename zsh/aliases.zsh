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
