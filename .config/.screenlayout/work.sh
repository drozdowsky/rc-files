#!/bin/sh
xrandr --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal \
    --output DP1-2 --mode 1920x1080 --pos 1920x0 --rotate normal \
    --output DP2 --mode 1680x1050 --pos 3840x0 --rotate normal
