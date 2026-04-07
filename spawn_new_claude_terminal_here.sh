#!/usr/bin/env bash
TARGET_DIR="${1:-$PWD}"
setsid alacritty --title claude-code -e sudo -u claudemax -i -- bash -ic "cd $(printf '%q' "$TARGET_DIR") && cnc; exec bash" & disown
