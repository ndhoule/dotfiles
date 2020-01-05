#
# Execute commands before a login (interactive) shell, after zshrc.
#
# See zsh(1) STARTUP/SHUTDOWN FILES for more documentation.
#

# Automatically start tmux when starting an interactive shell
if [[ -z "$TMUX" && -z "$EMACS" && -z "$VIM" && -z "$INSIDE_EMACS" && "$TERM_PROGRAM" != "vscode" ]]; then
  # Start a tmux server
  tmux start-server

  # Create a default session if one doesn't yet exist
  if ! tmux has-session 2> /dev/null; then
    tmux \
      new-session -d -s 0 \; \
      set-option -t 0 destroy-unattached off &> /dev/null
  fi

  # Attach to the last session
  exec tmux attach-session -d
fi

# Execute code in the background to not affect the current session
{
  # Compile zcompdump, if modified, to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!
