# vi:syntax=zsh
# -*- mode: sh -*-

#
# Flow shell integrations.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

function flow_start_server() {
  emulate -L zsh
  if [[ -f ".flowconfig" ]]; then
    # TODO: Suppress output
    yarn run flow server 2>&1 &
  fi
}
chpwd_functions=(${chpwd_functions[@]} "flow_start_server")
