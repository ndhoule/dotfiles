# Load direnv if it exists
if [[ -x $(which direnv) ]]; then
  eval "$(direnv hook $(basename $SHELL))"
fi
