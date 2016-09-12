# -*- mode: sh -*-

#
# Compatibility fixes for shell commands.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

# Bower needs noglob to work properly
[[ -x $(which bower) ]] && alias bower='noglob bower'
