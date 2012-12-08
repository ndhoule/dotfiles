# dotfiles
Configuration files zsh, vim, and tmux. I've used these dotfiles on Arch Linux,
FreeBSD, and OS X 10.8. I've made an effort to be as platform agnostic as possible,
but a few options are OS X-specific since that's my primarily dev environment right
now. Beware the `.gvimrc` and `.gitconfig` files in particular!


## Requirements
* Installation script requires GNU `readline`--the version of `readline` included
with OS X is not good enough. OS X users can install it using `brew install readline`;
FreeBSD/Linux users can install it with their package manager of choice.
* zsh, vim, and tmux (obviously). Optionally, gvim/MacVim.


## Installation
Run the following commands in your terminal to clone and set up the dotfiles. Feel
free to substitute the ~/.dotfiles directory with one of your choice.

```terminal
git clone git@github.com:ndhoule/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh
```

## Caveats
* If you launch tmux in 256-color mode and try to ssh into a remote machine, you
  might run into a misaligned cursor problem. Not sure why this is, but I suspect
  it's a conflict between tmux and the remote machine's termcap.
