#
# Execute commands before all (both interactive and non-interactive) shell invocations.
#
# This file is a good place to set environment variables and to modify the PATH. It should not print
# any output nor otherwise assume the shell is attached to a TTY.
#
# See zsh(1) STARTUP/SHUTDOWN FILES for more documentation.
#

export ZDOTDIR="${ZDOTDIR:-${HOME}}"
export PROJECTS_DIR="${PROJECTS_DIR:-$HOME/dev}"

#
# XDG Base Directory
#
# For more info, see the spec:
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
#

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-}"

if [[ -f "${XDG_CONFIG_HOME}/user-dirs.dirs" ]]; then
  source "${XDG_CONFIG_HOME}/user-dirs.dirs"
fi

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
  "${ZDOTDIR}/prompts"
  $fpath
)

path=(
  "${HOME}/.local/bin"
  $path
)

#
# antidote
#

# Where Antidote is installed
export ANTIDOTE_DIR="${XDG_CACHE_HOME}/antidote"

# Where Antidote should store plugins it downloads
export ANTIDOTE_HOME="${XDG_DATA_HOME}/antidote"

#
# asdf
#

export ASDF_CONFIG_FILE="${XDG_CONFIG_HOME}/asdf/config"
export ASDF_DATA_DIR="${XDG_DATA_HOME}/asdf"
export ASDF_DIR="${XDG_CACHE_HOME}/asdf"

export ASDF_GOLANG_DEFAULT_PACKAGES_FILE="${XDG_CONFIG_HOME}/asdf/default-golang-packages"
export ASDF_NPM_DEFAULT_PACKAGES_FILE="${XDG_CONFIG_HOME}/asdf/default-npm-packages"
export ASDF_PYTHON_DEFAULT_PACKAGES_FILE="${XDG_CONFIG_HOME}/asdf/default-python-packages"

# Prefer a user-specific asdf installation, falling back to a system installation if one exists
if [[ ! -d "${ASDF_DIR}" ]] && [[ -d "/opt/asdf-vm" ]]; then
  export ASDF_DIR="/opt/asdf-vm"
fi

#
# Docker/Podman
#

if (( $+commands[podman] )); then
  export DOCKER_HOST="unix://${XDG_RUNTIME_DIR}/podman/podman.sock"
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

#
# AWS Vault
#

export AWS_VAULT_BACKEND=pass
