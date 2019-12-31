# -*- mode: sh -*-

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
    local session_name="${t_org}/${t_repo} [${t_md5}]"

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
