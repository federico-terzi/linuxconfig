#!/bin/bash

DIR=".config Desktop Documents Downloads Dropbox linuxconfig insync Music Pictures projects Videos Tamplates 'VirtualBox VMs"

if [ "$1" = "dir" ] ; then
    find -L $(echo $DIR) -type d,l | rofi -dmenu | xargs xdg-open
elif [ "$1" = "vim" ] ; then
    find -L $(echo $DIR) -type f,l | rofi -dmenu | xargs -I{} xfce4-terminal -e 'vim {}'
elif [ "$1" = "docs" ] ; then
    find ~/linuxconfig/notes/ | rofi -dmenu | xargs -I{} xfce4-terminal -e "zsh -c 'bat {};zsh'"
elif [ "$1" = "script" ] ; then
    find ~/linuxconfig/script/ | rofi -dmenu | xargs -I{} xfce4-terminal -e '{}'
fi
