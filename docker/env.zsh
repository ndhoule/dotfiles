#
# Docker setup.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

if [[ $(which boot2docker) ]]; then
  eval "$(boot2docker shellinit)"
fi
