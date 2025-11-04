#!/bin/bash
# Get all current workspace numbers
current_workspaces=$(i3-msg -t get_workspaces | jq '.[].num')

# Find the highest workspace number
max_workspace=$(echo "$current_workspaces" | sort -nr | head -n1)

# Calculate next workspace number
next_workspace=$(( (max_workspace % 6) + 1))

# Switch to (or create) the next workspace
i3-msg workspace "$next_workspace"

