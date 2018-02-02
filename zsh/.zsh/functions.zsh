# -*- mode: sh -*-

#
# Helper functions that don't belong elsewhere.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

# Launch a static server in the current directory
unalias http-serve
http-serve() {
  local port=${1:-8080}

  if [[ -x $(which http-server) ]]; then
    http-server -p $port
  else
    python -m SimpleHTTPServer $port
  fi
}

# Keep a process running, restarting it if it crashes
always() {
  until $1; do
    echo "$1 died with exit code $?. Respawning..." >&2
    sleep 1
  done
}

goroot() {
  cd "$(git rev-parse --show-toplevel)"
}
