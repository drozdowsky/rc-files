# increase speed typing & disable screen power save mode
command -v xset && xset r rate 175 30 && xset s off &

command -v setxkbmap && setxkbmap -option caps:super &
command -v xmodmap && xmodmap ~/.Xmodmap &
command -v feh && feh --bg-fill --randomize ~/wallpaper/* &

# red light after midnight
command -v redshift && (pgrep redshift || redshift -l 51:17) &

systemctl --user import-environment DISPLAY
command -v dwm && exec dwm
