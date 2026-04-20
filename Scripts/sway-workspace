#!/bin/bash

TOTAL_WS=4

# Grab the currently focused workspace number using swaymsg and jq
CURRENT=$(swaymsg -t get_workspaces | jq '.[] | select(.focused==true).num')

if [ "$1" == "next" ]; then
    NEXT_WS=$(( CURRENT % TOTAL_WS + 1 ))
elif [ "$1" == "prev" ]; then
    NEXT_WS=$(( CURRENT == 1 ? TOTAL_WS : CURRENT - 1 ))
else
    exit 1
fi

# Force Sway to switch to (and create) the target workspace
swaymsg workspace number $NEXT_WS
