# ndhoule theme for oh-my-zsh.
#

BRACKET_COLOR="%{$fg[white]%}"
DIR_COLOR="%{$fg[cyan]%}"
GIT_BRANCH_COLOR="%{$fg[green]%}"
GIT_CLEAN_COLOR="%{$fg[green]%}"
GIT_DIRTY_COLOR="%{$fg[red]%}"

# Set variables for oh-my-zsh's git_prompt_info
ZSH_THEME_GIT_PROMPT_PREFIX="$BRACKET_COLOR:$GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=" $GIT_CLEAN_COLOR✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" $GIT_DIRTY_COLOR✗"

# Our elements
HOSTNAME="@%m"
USERNAME="%n"
CURRENT_DIR="$DIR_COLOR%~\$(git_prompt_info)"
CMD_PROMPT="$BRACKET_COLOR$"

# Drop it like it's hot
PROMPT="$USER$HOSTNAME $DIR $CMDPROMPT %{$reset_color%}"
# PROMPT=""  $
