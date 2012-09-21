# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="philips"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python django archlinux terminalapp virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#
# ~/.zshrc
#

# Set some useful variables
OS=$(uname -s)
HOSTNAME=$(hostname)


############################################################
## Environmental variables
############################################################
#export PROMPT="[%n@%m %1/]$ "
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
#case $OS in
#    Linux)
#        alias ls='ls --color=always'
#    ;;
#    FreeBSD)
#        alias ls='ls -G'
#    ;;
#esac


############################################################
## External scripts
############################################################
## Enable virtualenvwrapper if present
if [[ -f $(which virtualenvwrapper.sh) ]]; then
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

# alias more to less--I always say more when I mean less ;)
alias more='less'
# Make sure stuff piped through less retains color
alias less='less -R'

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

if [[ $HOSTNAME == "nathan" ]]; then
    alias netmount='sudo mount /mnt/netshares/NSP_Files/ ; \ 
                    sudo mount /mnt/netshares/Share/ ; \ 
                    sudo mount /mnt/netshares/User_Backup/ ; \ 
                    sudo mount /mnt/netshares/Archive/'
fi
