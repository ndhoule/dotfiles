Dotfiles
========
`zsh`, `emacs`, `vim`, and more!

## Getting Started
Run `scripts/bootstrap` to bootstrap all dotfiles into place. This will back up
any existing dotfiles into a safe directory.

Run `scripts/install` to run all topic-specific install scripts (e.g.
`sublime-text-2/install.rb`) as well as set sane OS X defaults (as defined in
`osx/set-defaults.rb`).

## General Notes
This dotfiles repository largely follows Zach Holman's [dotfiles](https://github.com/holman/dotfiles)
layout. Dotfiles are separated into topic folders, which contain a few special
files:

**\*.symlink**: Gets symlinked into a user's HOME directory. Can be either a
file or directory.

**install.\*** -- Gets run automatically when `scripts/install` is run

## `zsh` Configuration
I use [prezto](https://github.com/sorin-ionescu/prezto), an awesome zsh
framework. If you know what you're looking at, a lot of my config is
self-explanatory; if not, check out the [prezto readme](https://github.com/sorin-ionescu/prezto/blob/master/README.md)
for details.

## Caveats
These scripts are meant to run only on OS X, and will be straight-up funky on
any Windows-based machine. (If you want to use it on Linux, the scripts would
work with some minor modifications.) I'm hoping to make them more OS-agnostic in
the future, but for now, they target OS X only.

## Thanks
Thanks go out to Sorin Ionescu for his great [prezto](https://github.com/sorin-ionescu/prezto)
project.

Big thanks go out to Zach Holman for his awesome [dotfiles](https://github.com/holman/dotfiles)
repository, from which I drew much inpiration (and, okay--maybe I outright
stole a few ideas while I was at it).
