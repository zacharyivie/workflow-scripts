#!/usr/bin/env bash
#TARGET_DIR="$1"
setsid alacritty --title claude-code -e bash -ic "cd $(printf '%q' "$PWD") && codex; exec bash" & disown
