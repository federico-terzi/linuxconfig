#!/bin/bash

if [ $1 == "single" ] ; then
    xrandr --output DP-1 --off
    xrandr --output HDMI-2 --off
elif [ $1 == "double" ] ; then
    xrandr --output DP-1 --off
elif [ $1 == "reset" ] ; then
    xrandr --output DP-1 --mode 1920x1080 --pos 3840x0 --rotate normal --output HDMI-3 --off --output HDMI-2 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal
fi

