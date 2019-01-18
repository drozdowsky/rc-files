if [ -x "$(command -v bash)" ]; then
    source "$HOME/.bashrc"
else
    PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
    export PATH HOME TERM
    export ENV=$HOME/.kshrc
    source "$HOME/.kshrc"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# umake (firefox-developer)
if [ -d "$HOME/.local/share/umake/bin" ]; then
    PATH="$HOME/.local/share/umake/bin:$PATH"
fi


# default programs
export BROWSER="firefox"
export EDITOR="vim"
export TERMINAL="st"
export READER="zathura"


# add faster key holding / pressing
command -v xset && xset r rate 175 30 && xset s off &


# map capslock to super
command -v xmodmap && xmodmap ~/.Xmodmap
command -v setxkbmap && setxkbmap -option caps:super


# auto linux theme and wallpaper
command -v wal && wal -nR &


# run custom script, run xrandr etc. there 
if [ -f ~/.display.sh ]; then
	source ~/.display.sh
fi
