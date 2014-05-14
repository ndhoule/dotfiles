# -*- mode: sh -*-

#
# Shell aliases.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

alias l='ls -al'
alias ll='ls -l'
alias lll='ls -a'

# I always say more when I mean less
if [[ -x $(which less) ]]; then
  alias more='less'
fi

# Make sure stuff piped through less retains color
alias less='less -R'

# If installed, prefer vim over vi
if [[ -x $(which vim) ]]; then
  alias vi='vim'
fi

# Easy vim mode
alias egvim='gvim -y'

# Shortcuts for fixing dumb repls that don't know about arrow keys
if [[ -x $(which rlwrap) ]]; then
  alias clj='rlwrap clj'
  alias clojure='rlwrap clj'
  alias racket='rlwrap racket'
  alias sml='rlwrap sml'
fi
