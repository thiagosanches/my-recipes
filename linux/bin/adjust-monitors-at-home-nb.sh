#!/bin/bash

# notebook's monitor
xrandr --output eDP-1 --off

# primary monitor
xrandr --output DP-1 --auto --right-of HDMI-1 --primary

# left
xrandr --output HDMI-1 --rotate left
xrandr --output DP-1 --pos 1080x0
