DEFAULT_SHELL="bashrc"
case $(uname) in
    Linux)
        DEFAULT_SHELL="bashrc"
        ;;
    OpenBSD)
        DEFAULT_SHELL="kshrc"
        export ENV=$HOME/.kshrc
        PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games"
        ;;
    FreeBSD)
        DEFAULT_SHELL="kshrc"
        export ENV=$HOME/.kshrc
        PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/games"
        ;;
esac

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/share/umake/bin" ]; then
    PATH="$HOME/.local/share/umake/bin:$PATH"
fi

# rust
if [ -d "$HOME/.local/cargo/bin" ]; then
    PATH="$HOME/.local/cargo/bin:$PATH"
fi
export CARGO_HOME="$HOME/.local/cargo"
export RUSTUP_HOME="$HOME/.local/rustup"

# default programs
export BROWSER="firefox"
export EDITOR="vim"
export READER="zathura"

. "$HOME/.$DEFAULT_SHELL"
