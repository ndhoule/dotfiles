## Modeline & Notes ## {
    # Fold sections by default
    # vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
    #
    #
    # Nathan Houle's ~.zshrc
    #
# }
## zprezto Settings ## {
    # Source Prezto
    if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
      source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    fi
# }
## Global Functions ## {
    lowercase(){ echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/" }
    # Set some sweet, sweet variables
    os=$(lowercase $(uname -s))
    hostname=$(hostname)
# }
## Shell behavior ## {
    export HISTFILE=~/.zsh_history
    export HISTSIZE=1000           # Set bash history max commands saved
    export HISTFILESIZE=2000       # Set bash history max lines saved
    export HISTCONTROL=ignorespace # Don't store commands beginning with a space
    export HISTIGNORE="&:ls:ll:lll:pwd:exit:clear"  # Don't log boring shit
    set -o ignoreeof               # Prevent Ctrl-D from exiting shell
    set -o notify                  # Notify when background jobs terminate
# }
## Autocompletion ## {
    if [[ $hostname == "hoth" ]]; then
        compdef _pacman packer=pacman  # Enable autocompletion for packer
    fi
# }
## Aliases ## {
    ## Set additional ls commands
    alias ll='ls -l'
    alias lll='ls -a'

    # alias more to less--I always say more when I mean less ;)
    alias more='less'
    # Make sure stuff piped through less retains color
    alias less='less -R'

    ## Replace vi with vim if installed
    if [[ -x `which vim` ]]; then 
        alias vi='vim'
    fi

    ## Use 256-color tmux
    ## Having problems with misaligned cursors after sshing into a machine?
    ## Could be that $TERM isn't being set to screen-256 colors. Try installing ncurses.
    alias tmux='tmux -2'
# }
## Host/OS-specific ## {
    if [[ $hostname == "hoth" ]]; then 
        # Fix MacBook fn keys
        #bindkey "^[[1~" beginning-of-line
        #bindkey "^[[4~" end-of-line
        #bindkey "^[[3~" delete-char
    fi

    if [[ $hostname == "hoth" ]]; then
        zsh_plugins="archlinux virtualenvwrapper"
    fi

    if [[ $os == "darwin" ]]; then
        zsh_plugins="osx brew sublime terminalapp"
        alias brewall="brew update && brew upgrade `brew outdated`"
    fi

    if [[ $os == "freebsd" ]]; then
        # FreeBSD-specific options here
    fi
# }

