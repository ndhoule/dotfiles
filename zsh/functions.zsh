# -*- mode: sh -*-

#
# Helper functions that don't belong elsewhere.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

# Launch a static server in the current directory, passing an optional port
# number
server() {
  open "http://localhost:${1:-8000}" && $(which python) -m SimpleHTTPServer ${1:-8000}
}

# Keep a process running, restarting it if it crashes
always() {
  until $1; do
    echo "$1 died with exit code $?. Respawning..." >&2
    sleep 1
  done
}
