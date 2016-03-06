#
# Setup specific to `corellia`.
#
# Author:
#   Nathan Houle <nathan@nathanhoule.com>
#

function vm() {
  goto docker-vm
  eval "$(make shellinit)"
  make ssh
}
