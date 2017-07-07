export GOTO_ROOT="${HOME}/dev/src/github.com"
export GOTO_ORG="$(whoami)"

# `goto` is an alias that quickly navigates to a project in a workspace, cloning
# the project from GitHub if it does not exist. It assumes you store your
# projects in a Golang-style ($WORKSPACE/$USER_NAME/$PROJECT_NAME) layout.
# It uses pushd rather than cd and can also go to a user/organization directory
# if desired.
#
# It uses $GOTO_ROOT as the default $WORKSPACE and $GOTO_ORG as the default
# organization (specifying an organization is optional). Set either to override
# the defaults.
#
# Example usage:
#
#     goto ndhoule/
#     goto ndhoule/my-project
#     goto my-project
goto() {
    local is_org=false
    local dest=""
    local target=""

    case $1 in
        # e.g. goto ndhoule/
        */)
            is_org=true
            dest="${GOTO_ROOT}/$1"
            ;;

        # e.g. goto ndhoule/project
        */*)
            dest="${GOTO_ROOT}/$1"
            target="$1"
            ;;

        # e.g. goto project
        *)
            dest="${GOTO_ROOT}/${GOTO_ORG}/$1"
            target="${GOTO_ORG}/$1"
            ;;
    esac

    # Target is a user or organization (e.g. github.com/ndhoule) and does not
    # require any cloning behavior.
    if [ "$is_org" = true ] && [ ! -e "${dest}" ]; then
        mkdir "${dest}"
    fi

    # Target is a repository and should be cloned if it does not exist.
    if [ "$is_org" = false ] && [ ! -e "${dest}" ]; then
        if ! git clone "git@github.com:${target}.git" "${dest}"; then
            return 1
        fi
    fi

    # Target exists, but is not a directory.
    if [ ! -d "${dest}" ]; then
        echo "ERROR: Destination ${dest} exists but is not a directory."
        return 1
    fi

    pushd "${dest}" &> /dev/null
}

# zsh completion for goto.
_zsh_goto() {
    compadd $(find "${GOTO_ROOT}/${GOTO_ORG}" -type d -mindepth 1 -maxdepth 1 | sed "s;${GOTO_ROOT}/${GOTO_ORG}/;;")
    compadd $(find "${GOTO_ROOT}" -type d -mindepth 2 -maxdepth 2 | sed "s;${GOTO_ROOT}/;;")
}

if type compdef &> /dev/null ; then
  compdef _zsh_goto goto
fi

# TODO(ndhoule): Add bash completion
