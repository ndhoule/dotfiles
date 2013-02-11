## Modeline & Notes ## {
    #
    # Fold sections by default
    # vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
    #
# }
## Global Functions ## {
    lowercase(){ echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/" }
    # Set some sweet, sweet variables
    os=$(lowercase $(uname -s))
    hostname=$(hostname)
# }
## zprezto Settings ## {
    # Source prezto
    if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
      source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    fi
# }
## Sourced Shell Files ## {
    if [[ -e $(which virtualenvwrapper.sh) ]]; then
        source /usr/local/share/python/virtualenvwrapper.sh
    fi
# }
## Shell Behavior ## {
    export HISTFILE=~/.zsh_history
    export HISTSIZE=1000           # Set bash history max commands saved
    export HISTFILESIZE=2000       # Set bash history max lines saved
    export HISTCONTROL=ignorespace # Don't store commands beginning with a space
    export HISTIGNORE="&:ls:l:ll:lll:pwd:exit:clear"  # Don't log boring shit
    set -o ignoreeof               # Prevent Ctrl-D from exiting shell
    set -o notify                  # Notify when background jobs terminate
# }
## Aliases ## {
    ## Set additional ls commands
    alias l='ls -al'
    alias ll='ls -l'
    alias lll='ls -a'

    # alias more to less--I always say more when I mean less ;)
    alias more='less'
    # Make sure stuff piped through less retains color
    alias less='less -R'

    ## If installed, prefer vim over vi
    if [[ -x `which vim` ]]; then
        alias vi='vim'
    fi

    ## Always use 256-color tmux
    alias tmux='tmux -2'

    # Short Git aliases
    alias gst='git status'
    alias gc='git commit'
    alias gco='git checkout'
    alias gl='git pull'
    alias gpom="git pull origin master"
    alias gp='git push'
    alias gd='git diff'
    alias gb='git branch'
    alias gba='git branch -a'
    alias del='git branch -d'
# }
## Key Remaps ## {
    bindkey -v                                          # Use vi key bindings

    bindkey '\ew' kill-region                           # [Esc-w] - Kill from the cursor to the mark
    bindkey '^k' kill-line                              # [Ctrl-k] - Kill from cursor to end of line
    bindkey -s '\el' 'ls\n'                             # [Esc-l] - run command: ls
    bindkey -s '\e.' '..\n'                             # [Esc-.] - run command: .. (up directory)
    bindkey '^r' history-incremental-search-backward    # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
    bindkey '^[[5~' up-line-or-history                  # [PageUp] - Up a line of history
    bindkey '^[[6~' down-line-or-history                # [PageDown] - Down a line of history

    bindkey '^[[A' up-line-or-search                    # start typing + [Up-Arrow] - fuzzy find history forward
    bindkey '^[[B' down-line-or-search                  # start typing + [Down-Arrow] - fuzzy find history backward

    bindkey '^[[H' beginning-of-line                    # [Home] - Go to beginning of line
    bindkey '^[[1~' beginning-of-line                   # [Home] - Go to beginning of line
    bindkey '^[OH' beginning-of-line                    # [Home] - Go to beginning of line
    bindkey '^[[F'  end-of-line                         # [End] - Go to end of line
    bindkey '^[[4~' end-of-line                         # [End] - Go to end of line
    bindkey '^[OF' end-of-line                          # [End] - Go to end of line

    # emacs style
    bindkey '^a' beginning-of-line
    bindkey '^e' end-of-line

    bindkey ' ' magic-space                             # [Space] - do history expansion

    bindkey '^f' forward-word                           # [Ctrl-F] - move forward one word
    bindkey '^b' backward-word                          # [Ctrl-B] - move backward one word

    # Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
    bindkey '^?' backward-delete-char                   # [Delete] - delete backward
    bindkey '^[[3~' delete-char                         # [fn-Delete] - delete forward
    bindkey '^[3;5~' delete-char
    bindkey '\e[3~' delete-char
# }
