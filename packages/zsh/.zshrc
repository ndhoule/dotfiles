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
asdf
command-not-found
greymd/docker-zsh-completion
zsh-users/zsh-completions
zsh-users/zsh-history-substring-search

# Must be last bundle
zsh-users/zsh-syntax-highlighting
EOF

antigen apply

# Set LS_COLORS (used by `ls`, `tree`, etc.) if not yet set
if [[ -z "$LS_COLORS" ]]; then
  eval "$(dircolors --sh)"
fi

#
# Completion
#

setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt PATH_DIRS           # Perform path search even on command names with slashes.
setopt AUTO_MENU           # Show completion menu on a successive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
setopt EXTENDED_GLOB       # Needed for file modification glob modifiers with compinit
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.

# Load and initialize the completion system ignoring insecure directories with a
# cache time of 20 hours, so it should almost always regenerate the first time a
# shell is opened each day.
autoload -Uz compinit
_comp_files=(${ZDOTDIR:-$HOME}/.zcompdump(Nm-20))
if (( $#_comp_files )); then
  compinit -i -C
else
  compinit -i
fi
unset _comp_files

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR}/.zcompcache"

# Complete in case insensitive, partial word, then substring completion order
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
setopt CASE_GLOB

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Increase the number of errors based on the length of the typed word. But make
# sure to cap (at 7) the max-errors to avoid hanging.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directories
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Environment Variables
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Populate hostname completion. But allow ignoring custom entries from static
# */etc/hosts* which might be uninteresting.
zstyle -a ':prezto:module:completion:*:hosts' etc-host-ignores '_etc_host_ignores'

zstyle -e ':completion:*:hosts' hosts 'reply=(
  ${=${=${=${${(f)"$(cat {/etc/ssh/ssh_,~/.ssh/}known_hosts(|2)(N) 2> /dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
  ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2> /dev/null))"}%%(\#${_etc_host_ignores:+|${(j:|:)~_etc_host_ignores}})*}
  ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2> /dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'

# Don't complete uninteresting users...
zstyle ':completion:*:*:*:users' ignored-patterns \
  adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
  dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
  hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
  mailman mailnull mldonkey mysql nagios \
  named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
  operator pcap postfix postgres privoxy pulse pvm quagga radvd \
  rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

# Ignore multiple entries.
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# Kill
zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# SSH/SCP/RSYNC
zstyle ':completion:*:(ssh|scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

#
# Misc.
#
# TODO: Categorize this section
#

# Prevent Ctrl-D from exiting shell
set -o ignoreeof

# Notify when background jobs terminate
set -o notify

# Correct spelling on commands
setopt CORRECT

# Disable correction for some commands
alias ack="nocorrect ack"
alias ag="nocorrect ag"
alias cd="nocorrect cd"
alias cp="nocorrect cp"
alias grep="nocorrect grep"
alias ln="nocorrect ln"
alias man="nocorrect man"
alias mkdir="nocorrect mkdir"
alias mv="nocorrect mv"
alias rg="nocorrect rg"
alias rm="nocorrect rm"

# Ask for confirmation when running potentially dangerous commands
alias cp="${aliases[cp]:-cp} -i"
alias ln="${aliases[ln]:-ln} -i"
alias mv="${aliases[mv]:-mv} -i"
alias rm="${aliases[rm]:-rm} -i"

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

# Bind bck-i-search to [Ctrl-R]
bindkey '^R' history-incremental-search-backward

# keybindings for zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# [Ctrl-k] - Kill to EOL
bindkey '^k' kill-line

# [Ctrl-F] - Move forward one word
bindkey '^f' forward-word

# [Ctrl-B] - Move backward one word
bindkey '^b' backward-word

# Fix keybindings for special keys (e.g. Home, End, Delete, PgUp, PgDn, etc.)
# For more information, see: https://wiki.archlinux.org/index.php/Zsh#Key_bindings
typeset -g -A key

key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Down]="${terminfo[kcud1]}"
key[End]="${terminfo[kend]}"
key[Home]="${terminfo[khome]}"
key[Insert]="${terminfo[kich1]}"
key[Left]="${terminfo[kcub1]}"
key[PageDown]="${terminfo[knp]}"
key[PageUp]="${terminfo[kpp]}"
key[Right]="${terminfo[kcuf1]}"
key[ShiftTab]="${terminfo[kcbt]}"
key[Up]="${terminfo[kcuu1]}"

[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[ShiftTab]}"  ]] && bindkey -- "${key[ShiftTab]}"  reverse-menu-complete
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history

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
# direnv
#

if (( $+commands[direnv] )); then
  eval "$(direnv hook $(basename $SHELL))"

  # Unload direnv before executing tmux to avoid issues
  # https://github.com/direnv/direnv/wiki/Tmux
  alias tmux='direnv exec / tmux'
fi

#
# Aliases
#

alias l="ls -alh"
alias ll="ls -lh"
alias lll="ls -ah"

if [[ $+commands[xdg-open] ]]; then
  alias open="xdg-open"
fi

# Remap more to less when it exists
if (( $+commands[less] )); then
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
alias gcf='git commit --verbose --fixup'

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
alias gid='git diff --staged --no-ext-diff'
alias giD='git diff --staged --no-ext-diff --word-diff'

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

# Working Copy (w)
alias gws='git status --short'
alias gwS='git status'
alias gwd='git diff --no-ext-diff'
alias gwD='git diff --no-ext-diff --word-diff'

#
# GPG
#

export GPG_TTY=$TTY

if [[ -n $(gpgconf --list-options gpg-agent | awk -F: '$1=="enable-ssh-support" {print $10}') ]]; then
  unset SSH_AGENT_PID
  if [[ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]]; then
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
  fi
  autoload -U add-zsh-hook
  add-zsh-hook preexec _gpg-agent-update-tty
  function _gpg-agent-update-tty {
    gpg-connect-agent updatestartuptty /bye &>/dev/null
  }
fi

#
# More business
#

source "${ZDOTDIR}/.zsh/functions.zsh"
source "${ZDOTDIR}/.zsh/goto.zsh"
source "${ZDOTDIR}/.zsh/tmux.zsh"
