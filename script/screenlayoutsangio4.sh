#!/bin/sh

xrandr --output DisplayPort-1 --off --output DisplayPort-0 --off --output DVI-D-0 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1-5 --off --output HDMI-1-4 --off --output HDMI-1-3 --off --output DP-1-3 --off --output HDMI-A-1 --mode 1920x1080 --pos 3840x0 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 1920x0 --rotate normal

i3-msg workspace 1
i3-msg move workspace to output DVI-D-0
i3-msg workspace 2
i3-msg move workspace to output HDMI-A-0
i3-msg workspace 3
i3-msg move workspace to output HDMI-A-1


