# -*- mode: sh -*-

#
# Helper functions that don't belong elsewhere.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

# Launch a static server in the current directory, passing an optional port
# number
http-serve() {
  # Prefer http-server (`npm install -g http-server`) when available; fall back
  # to a simple Python SimpleHTTPServer when unavailable. Note that
  # SimpleHTTPServer has performance problems when serving more than a few files
  # simultaneously (e.g. an HTML file with more than 2-3 linked files)
  if [[ -x $(which http-server) ]]; then
    $(which http-server)
  else
    $(which python) -m SimpleHTTPServer
  fi
}

# Keep a process running, restarting it if it crashes
always() {
  until $1; do
    echo "$1 died with exit code $?. Respawning..." >&2
    sleep 1
  done
}
