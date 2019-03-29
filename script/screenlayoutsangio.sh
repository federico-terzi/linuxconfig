#!/bin/sh
xrandr --output VGA-1 --primary --mode 1280x1024 --pos 2960x88 --rotate normal --output HDMI-2 --mode 1280x1024 --pos 0x26 --rotate normal --output HDMI-1 --mode 1680x1050 --pos 1280x0 --rotate normal

i3-msg workspace 1
i3-msg move workspace to output HDMI-2
i3-msg workspace 2
i3-msg move workspace to output HDMI-1
i3-msg workspace 3
i3-msg move workspace to output VGA-1
