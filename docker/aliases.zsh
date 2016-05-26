# vi:syntax=zsh
# -*- mode: sh -*-

#
# Docker zsh aliases.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

if (( $+commands[docker-compose] )) ; then
  alias dc="docker-compose"
fi
