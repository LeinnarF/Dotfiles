#!/bin/bash

# Watch for active window changes
xprop -root -spy _NET_ACTIVE_WINDOW | while read -r; do
    win_id=$(xdotool getactivewindow 2>/dev/null)

    if [ -z "$win_id" ]; then
        echo "Desktop"
        continue
    fi

    app_name=$(xprop -id "$win_id" WM_CLASS 2>/dev/null | awk -F '"' '{print $4}')

    if [ -n "$app_name" ]; then
        echo "$app_name"
    else
        echo "Desktop"
    fi
done
