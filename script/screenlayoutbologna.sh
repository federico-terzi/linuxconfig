#!/bin/sh
xrandr --output DP-1 --mode 1366x768 --pos 0x176 --rotate normal --output HDMI-3 --off --output HDMI-2 --mode 1680x1050 --pos 3286x30 --rotate normal --output HDMI-1 --primary --mode 1920x1080 --pos 1366x0 --rotate normal

i3-msg workspace 1
i3-msg move workspace to output DP-1
i3-msg workspace 2
i3-msg move workspace to output HDMI-1
i3-msg workspace 3
i3-msg move workspace to output HDMI-2
