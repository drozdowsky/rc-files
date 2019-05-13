#!/bin/sh
# red light after midnight
command -v redshift && (pgrep redshift || redshift -l 51:17) &
command -v slstatus && slstatus &
command -v dwm && exec dwm
