#!/bin/bash

xfce4-terminal -e 'zsh -c "$(find ~/linuxconfig/script/*.sh | ~/.fzf/bin/fzf)";zsh'


