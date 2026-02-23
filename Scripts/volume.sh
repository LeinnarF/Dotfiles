#!/bin/bash

# Volume control
pactl set-sink-volume @DEFAULT_SINK@ +5% && notify-send "Volume Up" -i audio-volume-high
