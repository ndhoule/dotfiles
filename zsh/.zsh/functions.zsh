# -*- mode: sh -*-

#
# Helper functions that don't belong elsewhere.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

# Launch a static HTTP server in the current directory
http-serve() {
  local port=${1:-8080}

  if (( $+commands[http-server] )); then
    http-server -p $port
  else
    python -m SimpleHTTPServer $port
  fi
}

# cd to the root of the current git project.
goroot() {
  cd "$(git rev-parse --show-toplevel)"
}
