#!/usr/bin/env bash
# Close all windows in the active niri workspace, then move up one workspace.

export NIRI_SOCKET=/run/user/1000/niri.wayland-1.2212.sock

ws_id=$(niri msg -j focused-window | jq -r '.workspace_id')
self_id=$(niri msg -j focused-window | jq -r '.id')

# Close all other windows on the workspace first
while true; do
    win_id=$(niri msg -j windows \
      | jq -r --argjson ws "$ws_id" --argjson self "$self_id" \
        '[.[] | select(.workspace_id == $ws and .id != $self)] | .[0].id // empty')
    [[ -z "$win_id" ]] && break
    niri msg action focus-window --id "$win_id"
    niri msg action close-window
    sleep 0.1
done

# Now close self and move up
niri msg action focus-workspace-up
niri msg action close-window --id "$self_id"
