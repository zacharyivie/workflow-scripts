#!/usr/bin/env bash
niri msg action focus-workspace 255
obsidian & disown
sleep 1
/srv/dev/Projects/Scripts/spawn_claude_terminal.sh "$PWD"
