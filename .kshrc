. /etc/ksh.kshrc

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# main aliases
alias d='doas'
alias ls='ls -aF'

HISTFILE=$HOME/.ksh_history
HISTSIZE=5000

#cred=$(tput setaf 1)
#cgreen=$(tput setaf 2)
#cyellow=$(tput setaf 3)
#cblue=$(tput setaf 4)
#cmagenta=$(tput setaf 5)
#ccyan=$(tput setaf 6)
#creset=$(tput sgr0)

PS1="\H:\w \$ "
