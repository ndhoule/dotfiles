# vi:syntax=zsh
# -*- mode: sh -*-

#
# Keychain-related functions.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

function set-environment-variable() {
  security add-generic-password -U -a "${USER}" -D "environment variable" -s "$1" -w
}

function get-environment-variable() {
  security find-generic-password -a "${USER}" -D "environment variable" -s "$1" -w
}
