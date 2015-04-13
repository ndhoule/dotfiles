#
# Docker setup.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

if [[ $(which boot2docker) ]]; then
  eval "$(boot2docker shellinit > /dev/null 2>&1)"
fi
