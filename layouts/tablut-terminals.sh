#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

i3-msg append_layout $DIR/tablut-terminals.json

xfce4-terminal --working-directory "$HOME/projects/osarracino"
xfce4-terminal --working-directory "$HOME/projects/osarracino"
xfce4-terminal --working-directory "$HOME/projects/TablutCompetition/Tablut"

exit
