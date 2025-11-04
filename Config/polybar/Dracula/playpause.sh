#!/usr/bin/env bash

state=$(playerctl status 2>/dev/null)

if [[ "$state" == "Playing" ]]; then
    playpause="󰏤"
else
    playpause="󰐊"
fi

echo "$playpause"
