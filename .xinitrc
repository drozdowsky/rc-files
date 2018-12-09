command -v xset && xset r rate 175 30 &
command -v setxkbmap && setxkbmap -option caps:super &
command -v xmodmap && xmodmap ~/.Xmodmap &
feh --bg-fill --randomize ~/wallpaper/* &

systemctl --user import-environment DISPLAY
command -v dwm && exec dwm
