#
# Execute commands before a login (interactive) shell.
#
# See zsh(1) STARTUP/SHUTDOWN FILES for more documentation.
#

#
# Plugins
#

source "${ZDOTDIR}/.zsh/vendor/antigen/bin/antigen.zsh"

antigen bundles <<EOF
command-not-found
greymd/docker-zsh-completion
zsh-users/zsh-completions
zsh-users/zsh-history-substring-search

# Must be last bundle
zsh-users/zsh-syntax-highlighting
EOF

antigen apply

#
# Misc.
#
# TODO: Categorize this section
#

# Prevent Ctrl-D from exiting shell
set -o ignoreeof

# Notify when background jobs terminate
set -o notify


# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS="-F -g -i -M -R -S -w -X -z-4"

#
# Directory
#
# See `man zshoptions` for full documentation.
#

# Enable colorized output for ls. GNU and BSD ls enable color via different flags and environment
# variables; feature detect to figure out which we're dealing with
if (( $+commands[dircolors] )) ; then
  # GNU
  alias ls="${aliases[ls]:-ls} --color=auto"
else
  # BSD
  alias ls="${aliases[ls]:-ls} -G"
fi

# Push the current directory onto the pushd stack before cd
setopt AUTO_PUSHD
# Enable extended glob syntax
setopt EXTENDED_GLOB
# Perform implicit tees/cats on multiple redirections
setopt MULTIOS
# Don't push duplicate directories onto the pushd stack
setopt PUSHD_IGNORE_DUPS
# Silence pushd output
setopt PUSHD_SILENT
# Go to $HOME when cd is called with no argument
setopt PUSHD_TO_HOME
# Don't overwrite existing files via > or >> unless appended with ! (i.e. >! or >>!)
unsetopt CLOBBER

#
# Key remaps
#

bindkey '^R' history-incremental-search-backward

# keybindings for zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Fix a slew of MacBook keyboard keys/combinations
if [[ "${OSTYPE}" == darwin* ]]; then
  # [Fn-Arrow keys] - Home/End/PageUp/PageDown
  bindkey '^[[1~' beginning-of-line
  bindkey '^[[4~' end-of-line
  bindkey '^[[5~' up-line-or-history
  bindkey '^[[6~' down-line-or-history

  # [Fn-Delete] - Kill character forward
  bindkey '^[[3~' delete-char
  # [Ctrl-k] - Kill to EOL
  bindkey '^k' kill-line

  # [Ctrl-F] - Move forward one word
  bindkey '^f' forward-word
  # [Ctrl-B] - Move backward one word
  bindkey '^b' backward-word
fi

#
# History
#

# Don't write commands with a leading space to the history file
HISTCONTROL=ignorespace

# Write command history to file
HISTFILE="${HISTFILE:-${ZDOTDIR:-$HOME}/.zhistory}"

# Omit noisy commands from history
HISTIGNORE="&:ls:l:ll:lll:pwd:exit:clear"

# Limit persisted history size. (This value must be greater than SAVEHIST in order for
# HIST_EXPIRE_DUPS_FIRST to work)
HISTSIZE=8000

# Limit in-memory history size
SAVEHIST=7500

setopt BANG_HIST               # Treat the '!' character specially during textual history expansion
setopt EXTENDED_HISTORY        # Also write each command's timestamp and duration in the history file
setopt HIST_BEEP               # Beep when attempting to access a history entry that doesn't exist
setopt HIST_EXPIRE_DUPS_FIRST  # Remove duplicate events when truncating history before removing unique events
setopt HIST_FIND_NO_DUPS       # When searching history, don't display a duplicate of a previously displayed event
setopt HIST_IGNORE_ALL_DUPS    # When storing an event that is already in history, delete the old event first
setopt HIST_IGNORE_DUPS        # Don't store an event if it's a duplicate of the previous event
setopt HIST_IGNORE_SPACE       # Don't record events that start with a space
setopt HIST_SAVE_NO_DUPS       # Don't write old duplicate events out to the history file
setopt HIST_VERIFY             # Load a history line into the buffer on expansion instead of executing it
setopt SHARE_HISTORY           # Share history between sessions

#
# Prompt
#
# See zshmisc(1) and zshcontrib(1) for documentation.
#

autoload -Uz promptinit
promptinit

prompt ndhoule

#
# nodenv
#

# Load a locally-installed nodenv if it exists.
if [[ -s "${NODENV_ROOT}/bin/nodenv" ]]; then
  eval "$(nodenv init - --no-rehash zsh)"
# Otherwise, load a system-installed nodenv if it exists.
elif (( $+commands[nodenv] )); then
  eval "$(nodenv init - --no-rehash zsh)"
fi

#
# direnv
#

if (( $+commands[direnv] )); then
  eval "$(direnv hook $(basename $SHELL))"
fi

#
# Aliases
#

alias l="ls -alh"
alias ll="ls -lh"
alias lll="ls -ah"

# Remap more to less when it exists
if (( $+commaands[less] )); then
  alias more="less"
fi

# Retain color when piping through less
alias less="less -R"

# Shortcuts for fixing dumb repls that don"t know about arrow keys
if (( $+commands[rlwrap] )); then
  alias clj="rlwrap clj"
  alias clojure="rlwrap clj"
  alias racket="rlwrap racket"
  alias sml="rlwrap sml"
fi

# If hub is installed, use it as a Git wrapper
if (( $+commands[hub] )); then
  eval "$(hub alias -s)"
fi

# Docker
alias dc="docker-compose"

# Git
# Largely taken from https://github.com/sorin-ionescu/prezto/blob/master/modules/git/alias.zsh
alias g='git'

# Branch (b)
alias gb='git branch'

# Commit (c)
alias gc='git commit --verbose'
alias gco='git checkout'
alias gcp='git cherry-pick --ff'

# Fetch (f)
alias gf='git fetch'
alias gfa='git fetch --all'
alias gfc='git clone'
alias gfcr='git clone --recurse-submodules'
alias gfm='git pull'
alias gfr='git pull --rebase'

# Index (i)
alias gia='git add'
alias giA='git add --patch'
alias gir='git reset'
alias giR='git reset --patch'

# Log (l)
_git_log_brief_format='%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'
_git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
_git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'

alias gl='git log --topo-order --pretty=format:"${_git_log_medium_format}"'
alias gld='git log --topo-order --stat --patch --full-diff --pretty=format:"${_git_log_medium_format}"'
alias glo='git log --topo-order --pretty=format:"${_git_log_oneline_format}"'
alias glg='git log --topo-order --all --graph --pretty=format:"${_git_log_oneline_format}"'
alias glb='git log --topo-order --pretty=format:"${_git_log_brief_format}"'

# Push (p)
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpF='git push --force'
alias gpt='git push --tags'
alias gpc='git push --set-upstream origin "$(git-branch-current 2> /dev/null)"'
alias gpp='git pull origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'

# Rebase (r)
alias gr='git rebase'

# Stash (s)
alias gs='git stash'

# Tag (t)
alias gt='git tag'

#
# More business
#

source "${ZDOTDIR}/.zsh/functions.zsh"
source "${ZDOTDIR}/.zsh/goto.zsh"
source "${ZDOTDIR}/.zsh/tmux.zsh"
