# red light after midnight
command -v redshift && (pgrep redshift || redshift -l 51:17) &

systemctl --user import-environment DISPLAY
command -v dwm && exec dwm
