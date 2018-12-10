## Additional monitors
- xrandr - list connected monitors
- lsusb - list connected devices

8.2.1. Case 1: everybody gets the same output
`xrandr --output VGA1 --mode 1024x768 --same-as LVDS1`

8.2.2. Case 2: you can see more than your audience
`xrandr --output VGA1 --mode 1024x768 --right-of LVDS1`
