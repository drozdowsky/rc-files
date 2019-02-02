. /etc/ksh.kshrc

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# main aliases
alias d='doas'
alias sudo='doas'
alias ls='ls -aF'

HISTCONTROL=ignoredups
HISTFILE=$HOME/.ksh_history
HISTSIZE=5000

#cred=$(tput setaf 1)
#cgreen=$(tput setaf 2)
#cyellow=$(tput setaf 3)
#cblue=$(tput setaf 4)
#cmagenta=$(tput setaf 5)
#ccyan=$(tput setaf 6)
#creset=$(tput sgr0)

# man ksh | grep PS1
if [[ $(id -u) -ne 0 ]]
then
    # nonroot
    PS1="\H:\w \\$ "
else
    PS1="\w \\$ "
fi
