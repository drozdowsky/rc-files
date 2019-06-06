#!/bin/sh
xrandr --output VIRTUAL1 --off --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP1-3 --off --output DP1-2 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP1-1 --off --output DP2 --mode 1680x1050 --pos 3840x30 --rotate normal
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-2 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-2 --mode 1680x1050 --pos 3840x30 --rotate normal
