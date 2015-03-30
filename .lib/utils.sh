#!/usr/bin/env bash

COLOR_RED=$(tput setaf 1)
COLOR_YELLOW=$(tput setaf 3)
COLOR_PURPLE=$(tput setaf 5)
COLOR_GRAY=$(tput setaf 8)
COLOR_BLUE=$(tput setaf 38)
COLOR_BOLD=$(tput bold)
COLOR_RESET=$(tput sgr0)

_log() {
  echo "${COLOR_GRAY}[$(date -u +"%Y-%m-%dT%H:%M:%SZ")]${COLOR_RESET} $@"
}

log_error() {
  _log "${COLOR_BOLD}${COLOR_RED}Error:${COLOR_RESET} $@"
}

log_warn() {
  _log "${COLOR_BOLD}${COLOR_YELLOW}Warning:${COLOR_RESET} $@"
}

log_info() {
  _log "${COLOR_BOLD}${COLOR_BLUE}Info:${COLOR_RESET} $@"
}

log_debug() {
  _log "${COLOR_BOLD}${COLOR_PURPLE}Debug:${COLOR_RESET} $@"
}

#
# Log error output and exit.
#

fatal() {
  log_error "$@"
  exit 1
}

#
# Ask for the administrator password and keep sudo access alive indefinitely.
#

ensure_sudo() {
  sudo -v -p "This script requires administrative privileges. Please enter your password: "

  # Keep sudo alive
  while true; do
    sudo -n true; sleep 60; kill -0 "$$" || exit;
  done 2>/dev/null &
}
