# Load direnv if it exists
if [[ -x direnv ]]; then
  eval "$(direnv hook $(basename $SHELL))"
fi
