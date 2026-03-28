# autocompletion
autoload -Uz compinit; compinit

bindkey "^A" "beginning-of-line"
bindkey "^E" "end-of-line"
bindkey '^R' "history-incremental-search-backward"

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hubertdrozdowsky/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/hubertdrozdowsky/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hubertdrozdowsky/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/hubertdrozdowsky/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
