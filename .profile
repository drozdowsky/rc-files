if [ -x "$(command -v bash)" ]; then
    # this must be here because tmux doesn't see it otherwise
    . "$HOME/.bashrc"
else
    if [ -x "$(command -v ksh)" ]; then
        PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
        export ENV=$HOME/.kshrc
        . "$HOME/.kshrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# umake (firefox-developer)
if [ -d "$HOME/.local/share/umake/bin" ]; then
    PATH="$HOME/.local/share/umake/bin:$PATH"
fi

export PATH

# default programs
export BROWSER="firefox"
if [ -x "$(command -v nano)" ]; then
    export EDITOR="nano"
fi
if [ -x "$(command -v nvim)" ]; then
    export EDITOR="nvim"
fi
if [ -x "$(command -v vim)" ]; then
    export EDITOR="vim"
fi
export TERM="st"
export READER="zathura"
