export ENV="$HOME/.shrc"
export LANG=it_IT.UTF-8

case $(uname) in
    OpenBSD)
        PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games"
        ;;
    FreeBSD)
        PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/games"
        ;;
    Darwin)
        PATH="/usr/local/opt/python@3.8/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
        ;;
esac

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/work/bin" ] ; then
    PATH="$HOME/work/bin:$PATH"
fi

if [ -d "$HOME/.local/cargo/bin" ]; then
    PATH="$HOME/.local/cargo/bin:$PATH"
fi
export PATH
export CARGO_HOME="$HOME/.local/cargo"
export RUSTUP_HOME="$HOME/.local/rustup"

export WORKON_HOME="$HOME/.virtualenvs"
export VIRTUALENVWRAPPER_PYTHON=$(which python3)

export BROWSER="firefox"
export EDITOR="vim"
export READER="zathura"
export RIPGREP_CONFIG_PATH="$HOME/.config/.ripgreprc"
export FZF_DEFAULT_COMMAND='rg --files'
