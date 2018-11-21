#!/bin/sh
pgrep --full "^st -n dropdown" || ((st -n dropdown -e tmux new-session -A -s d &) && sleep 0.06)

i3-msg "[instance=\"dropdown\"] scratchpad show; [instance=\"dropdown\"] move position center"
