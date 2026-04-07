#!/usr/bin/env bash
# Usage: find_app_workspace.sh <app-id>
# Prints the workspace index of the first workspace where the given app is open.
# The index is suitable for use with: niri msg action focus-workspace <index>

set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <app-id>" >&2
    exit 1
fi

APP_ID="$1"

workspace_idx=$(
    jq -rn \
        --argjson windows "$(niri msg -j windows)" \
        --argjson workspaces "$(niri msg -j workspaces)" \
        --arg app "$APP_ID" '
        ($windows | map(select(.app_id == $app)) | first | .workspace_id) as $wid |
        ($workspaces | map(select(.id == $wid)) | first | .idx)
    '
)

if [[ -z "$workspace_idx" || "$workspace_idx" == "null" ]]; then
    echo "No window with app-id '$APP_ID' found." >&2
    exit 1
fi

echo "$workspace_idx"
