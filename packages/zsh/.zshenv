#
# Execute commands before all (both interactive and non-interactive) shell invocations.
#
# This file is a good place to set environment variables and to modify the PATH. It should not print
# any output nor otherwise assume the shell is attached to a TTY.
#
# See zsh(1) STARTUP/SHUTDOWN FILES for more documentation.
#

export ZDOTDIR="${ZDOTDIR:-$HOME}"
export PROJECTS_DIR="${PROJECTS_DIR:-$HOME/dev}"

#
# Editor
#

export ALTERNATE_EDITOR=""
export EDITOR="nvim"
export GREPPER="ag"
export PAGER="less"
export GIT_EDITOR="nvim"
export SVN_EDITOR="nvim"
export VISUAL="${EDITOR}"

#
# Path
#

# Remove duplicate values from any path lists
typeset -gU cdpath fpath mailpath path

fpath=(
  $ZDOTDIR/.zprompts
  $fpath
)

path=(
  $HOME/bin
  $path
)

#
# asdf
#

export ASDF_DIR="${ASDF_DIR-}"

if [[ -z "${ASDF_DIR}" ]]; then
  if [[ -d /opt/asdf-vm ]]; then
    export ASDF_DIR="/opt/asdf-vm"
  else if [[ -d "$HOME/.asdf" ]]
    export ASDF_DIR="$HOME/.asdf"
  fi
fi

#
# Go
#

export GOPATH="${GOPATH:-$PROJECTS_DIR}"

path=("${GOPATH}/bin" $path)

#
# Android SDK
#

# If on OS X and the Android SDK is installed, add its CLI tools to the path
if [[ "${OSTYPE}" == darwin* && -d "${HOME}/Library/Android/sdk/platform-tools" ]]; then
  path=($HOME/Library/Android/sdk/platform-tools $path)
fi
