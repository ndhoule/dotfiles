# `@ndhoule/dotfiles`

My personal environment.

 ## Getting Started

Clone the repository:

```sh
$ git clone --recursive git@github.com:ndhoule/dotfiles.git
```

Run the install script:

```sh
$ ./install
```

### Linking Packages

To install an individual package or to refresh links, run:

```sh
$ cd packages
$ stow --target=$HOME --verbose=1 <package_name>
```

## Requirements

- [Linux only] Material Design Icons font (https://materialdesignicons.com/)

## Further Setup

### npm

Create an npm token on `npmjs.com`. Don't store it in your npm configuration file directly; instead, store it in `~/.envrc`:

```sh
export NPM_AUTH="{{ token }}"
```

The configuration specified in `packages/javascript/.npmrc` will pick up this value.
