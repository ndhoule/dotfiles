# Nathan Houle's dotfiles

Configuration files zsh, vim, and tmux. Also a petty excuse to learn git.

I use these dotfiles on Arch Linux and FreeBSD, but they'll probably work just fine
on OS X, too. The installer is still a work in progress and will probably only work
on Linux systems.


## Installation

Run the following commands in your terminal to clone and set up the dotfiles. Feel
free to substitute the ~/projects directory with one of your choice.

```terminal
git clone git@github.com:ndhoule/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh
```

## Caveats
If you launch tmux in 256-color mode and try to ssh into a remote machine, you might
run into a misaligned cursor problem. This is because some machines (I'm looking at
you, headless servers) don't have the screen-256colors termcap option. You can either
change your term to TERM=xterm and deal with 8-color mode, or install ncurses.
