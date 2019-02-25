# red light after midnight
command -v redshift && (pgrep redshift || redshift -l 51:17) &

command -v awesome && exec /usr/bin/awesome
command -v bspwm && exec /usr/bin/bspwm
command -v dwm && exec dwm
