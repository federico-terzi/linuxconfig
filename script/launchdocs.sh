#!/bin/bash

xfce4-terminal -e 'zsh -c "bat $(find ~/linuxconfig/notes/*.md | ~/.fzf/bin/fzf)";zsh'


