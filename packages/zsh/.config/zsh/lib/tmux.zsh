#
# Tmux helpers.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

_chpwd_tmux() {
  # TODO(ndhoule): Break this into a helper and reuse it here and in `mux`
  local t_org=$(basename "$(dirname "${PWD}")")
  local t_repo=$(basename "${PWD}")
  local t_md5=$(echo "${PWD}" | md5sum | cut -d ' ' -f 1)
  local session_name="${t_org//\./_}/${t_repo//\./_} [${t_md5}]"

  if tmux has-session -t "${session_name}" &> /dev/null; then
    # If there is an existing session we're not attached to, switch to that
    # session
    if [[ "$(tmux display-message -p '#S')" != "${session_name}" ]]; then
      tmux switch-client -t "${session_name}"
    fi
  else
    # If no session exists for this directory, and there's a project-local
    # tmuxp configuration, load it instead of the generic config
    if [[ -f .tmuxp.yml || -f .tmuxp.yaml || -f .tmuxp.json ]]; then
      tmuxp load .
    fi
  fi
}

add-zsh-hook chpwd _chpwd_tmux

# Automatically start tmux in interactive shells
if (( $+commands[tmux] )); then
  if [[
    # Only run in interactive sessions
    -n "${PS1}" &&
    # Don't start nested sessions
    -z "${TMUX}" &&
    # Don't start tmux within another program, e.g. Neovim or VSCode's terminal
    -z "${EMACS}" &&
    -z "${VIM}" &&
    -z "${INSIDE_EMACS}" &&
    "${TERM_PROGRAM}" != "vscode"
  ]]; then
    # Ensure the tmux server is started
    tmux start-server

    # Create a default session if one doesn't yet exist
    if ! tmux has-session 2> /dev/null; then
      tmux \
        new-session -d -s 0 \; \
        set-option -t 0 destroy-unattached off &> /dev/null
    fi

    # Attach to the default session
    exec tmux attach-session -d
  fi
fi
