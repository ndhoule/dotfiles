# -*- mode: sh -*-

#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Nathan Houle <nathan@nathanhoule.com>
#

export GOPATH="${HOME}/dev"

env_vars=(
  # Add environment variables here
)

# TODO: Make this work cross platform
for key in "${env_vars[@]}"; do
  val=$(security find-generic-password -w -a ${USER} -D "environment variable" -s "${key}" 2> /dev/null)
  if [[ $? -eq 0 ]]; then
    export "${key}"="${val}"
  else
    echo "WARNING: Attempted to set environment variable \`${key}\` from keychain but failed."
  fi
done

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
