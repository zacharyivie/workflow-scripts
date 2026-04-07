#!/usr/bin/env bash
niri msg action focus-workspace 255
code --new-window & disown
sleep 1
/srv/dev/Projects/Scripts/spawn_new_claude_terminal_here.sh
