# if running bash
if [ -f "$HOME/.bashrc" ]; then
  source "$HOME/.bashrc"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
# Ubuntu make installation of Ubuntu Make binary symlink
PATH=$HOME/.local/share/umake/bin:$PATH


# default programs
export BROWSER="firefox"
export EDITOR="vim"
export TERMINAL="st"
export READER="zathura"


# add faster key holding / pressing
command -v xset && xset r rate 175 30


# map capslock to super
command -v setxkbmap && setxkbmap -option caps:super
command -v xmodmap && xmodmap ~/.Xmodmap


if [ -f ~/.display.sh ]; then
	source ~/.display.sh
fi


# auto linux theme and wallpaper
command -v wal && wal -R
