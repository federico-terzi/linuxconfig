#!/bin/sh

FIRST=$(xrandr | grep " connected" | awk '{print $1}' | sort | head -1 | tail -1)
SECOND=$(xrandr | grep " connected" | awk '{print $1}' | sort | head -2 | tail -1)
THIRD=$(xrandr | grep " connected" | awk '{print $1}' | sort | head -3 | tail -1)

# Vertical monitor
xrandr --output DisplayPort-1 --off --output DisplayPort-0 --off --output $FIRST --mode 1920x1080 --pos 0x0 --rotate left --output HDMI-1-5 --off --output HDMI-1-4 --off --output HDMI-1-3 --off --output DP-1-3 --off --output $THIRD --mode 1920x1080 --pos 3000x360 --rotate normal --output $SECOND --mode 1920x1080 --pos 1080x360 --rotate normal

# Horizontal monitor
#xrandr --output DisplayPort-1 --off --output DisplayPort-0 --off --output $FIRST --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1-5 --off --output HDMI-1-4 --off --output HDMI-1-3 --off --output DP-1-3 --off --output $THIRD --mode 1920x1080 --pos 3840x0 --rotate normal --output $SECOND --mode 1920x1080 --pos 1920x0 --rotate normal

i3-msg workspace 1
i3-msg move workspace to output $FIRST 
i3-msg workspace 2
i3-msg move workspace to output $SECOND
i3-msg workspace 3
i3-msg move workspace to output $THIRD 


