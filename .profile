# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
# Ubuntu make installation of Ubuntu Make binary symlink
PATH=$HOME/.local/share/umake/bin:$PATH
# add faster key holding / pressing
xset r rate 175 30
# Set proper ordering for displays - NSN
xrandr --listmonitors | grep 'DP-1-2' && xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-2 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-2 --off --output HDMI-1 --off --output DP-1 --off --output DP-1-3 --off --output DP-2 --mode 1680x1050 --pos 3840x0 --rotate normal --output DP-1-1 --off

# Set background on start 
#feh --bg-fill ~/wallpapers/starry_night.jpg
wal -R
