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

  # Silence PID output when backgrounding task
  setopt LOCAL_OPTIONS NO_NOTIFY NO_MONITOR

  local NO_AUTOSTART_FLOW_SERVER=${NO_AUTOSTART_FLOW_SERVER:-}

  if [[ -f ".flowconfig" && -x "./node_modules/.bin/flow" && -z "${NO_AUTOSTART_FLOW_SERVER}" ]]; then
    echo "Starting a flow server."
    # Run server in background and disown to mute notification
    # nohup outputs when process exits
    nohup ./node_modules/.bin/flow start &> /dev/null & disown
  fi
}

chpwd_functions=(${chpwd_functions[@]} "flow_start_server")
