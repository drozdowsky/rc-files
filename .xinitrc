# red light after midnight
command -v redshift && (pgrep redshift || redshift -l 51:17) &

command -v bspwm && exec bspwm
command -v dwm && exec dwm
