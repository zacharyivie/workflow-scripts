#!/usr/bin/env bash
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

if workspace_idx="$("$SCRIPT_DIR/find_app_workspace.sh" obsidian 2>/dev/null)"; then
    niri msg action focus-workspace "$workspace_idx"
    exit 0
fi

niri msg action focus-workspace 255
obsidian & disown
sleep 1
"$SCRIPT_DIR/spawn_claude_terminal.sh" '/srv/dev/Projects/SecondBrain'
