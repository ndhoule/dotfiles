#
# Setup specific to `corellia`.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

function {
  local SEGMENT_DOTFILES_PATH="${DEV_PATH}/segmentio/dotfiles/source"
  declare -a FILES
  FILES=(general go npm release vm)

  for file in "${FILES[@]}"; do
    if [[ -f "${SEGMENT_DOTFILES_PATH}/${file}.sh" ]]; then
      source "${SEGMENT_DOTFILES_PATH}/${file}.sh"
    fi
  done
}
