# Dotfiles

My `$HOME`.

## Getting Started

Run `make install` to run all install scripts.

## File Layout

This repository largely follows Zach Holman's [dotfiles](https://github.com/holman/dotfiles) layout. Dotfiles are separated into topic folders; a few files are treated specially:

- `{filename}.symlink`: Symlinked to `$HOME/.filename`. Can be a file or a directory.
- `.install(\..*)?`: Executed whenever `make install` is run.

## `zsh` Configuration

This setup leverages [prezto](https://github.com/sorin-ionescu/prezto), a zsh framework. Check out the [prezto readme](https://github.com/sorin-ionescu/prezto/blob/master/README.md) for details.

## Compatibility

The setup scripts are only tested on OS X.

## Credits

- Sorin Ionescu / [prezto](https://github.com/sorin-ionescu/prezto)
- Zach Holman / [dotfiles](https://github.com/holman/dotfiles)
