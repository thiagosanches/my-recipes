#!/bin/bash

# notebook's monitor
xrandr --output eDP-1 --off

# primary monitor
xrandr --output HDMI-1 --auto --right-of DP-1 --primary

# left
xrandr --output DP-1 --rotate left
xrandr --output HDMI-1 --pos 1080x0
