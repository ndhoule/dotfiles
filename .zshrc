#
# ~/.zshrc
#

# Set some useful variables
OS=$(uname -s)
HOSTNAME=$(hostname)

# TMUX
if which tmux 2>&1 >/dev/null; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux

    # when quitting tmux, try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi


############################################################
## Environmental variables
############################################################
export PROMPT="[%n@%m %1/]$ "
export PATH=$PATH:$HOME/bin
export PAGER=less
export EDITOR=vim
export SVN_EDITOR=vim

############################################################
## Shell behavior
############################################################
export HISTCONTROL=ignorespace # Don't store commands beginning with a space
export HISTSIZE=1000           # Set bash history max commands saved
export HISTFILESIZE=2000       # Set bash history max lines saved
export HISTIGNORE="&:ls:ll:lll:pwd:exit:clear"  # Don't log boring shit
set -o ignoreeof               # Prevent Ctrl-D from exiting shell
set -o notify                  # Notify when background jobs terminate

## Colorize ls if available; modify command per OS
case $OS in
    Linux)
        alias ls='ls --color=always'
    ;;
    FreeBSD)
        alias ls='ls -G'
    ;;
esac


############################################################
## External scripts
############################################################
## Enable virtualenvwrapper if present
if [ -f $(which virtualenvwrapper.sh) ]; then
    VIRTUALENVPATH=$(which virtualenvwrapper.sh)
    export WORKON_HOME=$HOME/.virtualenvs
    source $VIRTUALENVPATH
fi


############################################################
## Aliases
############################################################
## Set additional ls commands
alias ll='ls -l'
alias lll='ls -al'

# Make sure stuff piped through less retains color
alias less='less -R'
# alias more to less--I always say more when I mean less ;)
alias more='less'

## Replace vi with vim if installed
[ -f $(which vim) ] && alias vi='vim'

## Use 256-color tmux
alias tmux='tmux -2'


############################################################
## Host-specific commands
############################################################
if [[ $HOSTNAME == "hoth" ]]; then 
    # Fix MacBook fn keys
    bindkey "^[[1~" beginning-of-line
    bindkey "^[[4~" end-of-line
    bindkey "^[[3~" delete-char
fi


