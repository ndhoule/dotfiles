# -*- mode: sh -*-

#
# Helper functions that don't belong elsewhere.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

# Find files and execute a command on them
function find-exec {
  find . -type f -iname "*${1:-}*" -exec "${2:-file}" '{}' \;
}

# cd to the root of the current git project.
goroot() {
  cd "$(git rev-parse --show-toplevel)"
}

# Launch a static HTTP server in the current directory
http-serve() {
  local port=${1:-8080}

  if (( $+commands[http-server] )); then
    http-server -p $port
  elif (( $+commands[python3] )); then
    alias http-serve="python3 -m http.server"
  else
    alias http-serve="python -m SimpleHTTPServer"
  fi
}

# Create and enter a directory
mkcd() {
  mkdir -p "$@" && cd "$@";
}
