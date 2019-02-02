if [ -x "$(command -v bash)" ]; then
    . "$HOME/.bashrc"
else
    PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
    export ENV=$HOME/.kshrc
    . "$HOME/.kshrc"
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

# add faster key holding / pressing
if [ -x "$(command -v xset)" ]; then
    xset r rate 175 30
    xset s off
    xset b off
fi

# map capslock to super
if [ -x "$(command -v xmodmap)" ]; then
    xmodmap ~/.Xmodmap
else
    if [ -x "$(command -v setxkbmap)" ]; then
        setxkbmap -option caps:super
    fi
fi

# auto linux theme and wallpaper
if [ -x "$(command -v wal)" ]; then
    wal -nR
fi

# wallpaper
if [ -x "$(command -v feh)" ]; then
    feh --bg-fill --randomize ~/wallpaper/*
fi

# run custom script, run xrandr etc. there 
if [ -f ~/.display.sh ]; then
	. ~/.display.sh
fi
