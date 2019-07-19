if [ "$0" = "sh" ] || [ "$0" = "su" ]; then
    PS1='\h:\w \$ '
    return
fi

if [ -f /etc/ksh.kshrc ]; then
    . /etc/ksh.kshrc
fi

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

case $(uname) in
    FreeBSD)
        alias ls='ls -aGF'
        ;;
    OpenBSD)
        alias ls='ls -aF'
        ;;
esac

HISTCONTROL=ignoredups
HISTFILE=$HOME/.ksh_history
HISTSIZE=50000

set -o emacs
bind "^I=complete-list"
bind "^[[H=beginning-of-line"
bind "^[[F=end-of-line"
bind "^[[P=delete-char-forward"
alias __A=`echo "\020"`
alias __B=`echo "\016"`
alias __C=`echo "\006"`
alias __D=`echo "\002"`

if [ $(id -u) -ne 0 ]; then
    PS1="\[\033[031m\u\h\033[033m:\w\033[0m \$ \]"
else
    PS1="\h:\w \$ "
fi
