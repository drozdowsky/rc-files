# autocompletion
autoload -Uz compinit; compinit

PS1="luv %~ %# "

bindkey "^A" "beginning-of-line"
bindkey "^E" "end-of-line"
bindkey '^R' "history-incremental-search-backward"
