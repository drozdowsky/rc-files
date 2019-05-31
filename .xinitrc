#!/bin/sh
# add faster key holding / pressing
if [ -x "$(command -v xset)" ]; then
    xset r rate 175 30
    xset s off
    xset dpms 0 0 0
    xset b off
fi

# set display brightness
if [ -x "$(command -v xbacklight)" ]; then
    bright 100
    bright -50
fi

# # auto linux theme and wallpaper
# if [ -x "$(command -v wal)" ]; then
#     wal -nR
# else
#     # wallpaper
#     if [ -x "$(command -v feh)" ]; then
#         feh --bg-fill --no-fehbg --randomize ~/Pictures/wallpaper/*
#     fi
# fi

# run custom script, run xrandr etc. there 
if [ -f ~/.config/.display.sh ]; then
   . ~/.config/.display.sh
fi

# map capslock to super
if [ -x "$(command -v setxkbmap)" ]; then
    setxkbmap -option caps:super
else
    if [ -x "$(command -v xmodmap)" ]; then
        xmodmap ~/.config/.Xmodmap
    fi
fi

# red light after midnight
if [ -x "$(command -v redshift)" ]; then
    pkill -9 redshift
    redshift -l 51:17 &
fi

# slstatus
if [ -x "$(command -v slstatus)" ]; then
    pkill -9 slstatus
    slstatus &
fi

if [ -z "$(pgrep dwm)" ]; then
    exec $(which dwm)
fi
