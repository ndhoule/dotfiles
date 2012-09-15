#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return
[ -z "$PS1" ] && return

# If running interactively, then run til 'fi' at EOF
if [ "$PS1" ]; then
export TERM=screen-256color

# Set some useful variables
OS=$(uname -s)
HOSTNAME=$(hostname)


############################################################
## Environmental variables
############################################################
export PS1='[\u@\h \W]\$\[\e[0m\] '
#export PS1='\[\e[1;32m\][\u@\h \W]\$ \[\e[0m\]'  # Color prompt green
export PATH=$PATH:$HOME/bin
export PAGER=less
export EDITOR=vim
export SVN_EDITOR=vim


############################################################
## Bash behavior
############################################################
shopt -s histappend            # Append to history file, don't overwrite it
export HISTCONTROL=ignorespace # Don't store commands beginning with a space
export HISTSIZE=1000           # Set bash history max commands saved
export HISTFILESIZE=2000       # Set bash history max lines saved
export HISTIGNORE="&:ls:ll:lll:pwd:exit:clear"  # Don't log boring shit
complete -cf sudo              # Tab complete for sudo
set -o ignoreeof               # Prevent Ctrl-D from exiting shell
set -o notify                  # Notify when background jobs terminate
shopt -s checkwinsize          # Check window size after command exec

## Colorize ls if available
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" \
      || eval "$(dircolors -b)"
    # Make sure we're using correct command depending on OS
    case $OS in
        Linux)
            alias ls='ls --color=auto'
        ;;
        FreeBSD)
            alias ls='ls -G'
        ;;
    esac
fi


############################################################
## External scripts
############################################################
# Enable bash completion if present
[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion

## Activate git completion script if present
[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash

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

## Replace vi with vim if installed
[ -f $(which vim) ] && alias vi='vim'


############################################################
## Host-specific commands
############################################################
#if [ $HOSTNAME == 'Linux' ]; then
#    
#fi



#--- EOF ---#
fi
