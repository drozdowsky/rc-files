#!/bin/sh
xrandr --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal \
    --output DP1-2 --off \
    --output HDMI2 --off \
    --output HDMI1 --off \
    --output DP1 --off \
    --output DP1-3 --off \
    --output DP2 --off \
    --output DP1-1 --off


xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal \
    --output DP-1-2 --off \
    --output HDMI-2 --off \
    --output HDMI-1 --off \
    --output DP-1 --off \
    --output DP-1-3 --off \
    --output DP-2 --off \
    --output DP-1-1 --off
