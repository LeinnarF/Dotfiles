#!/bin/bash

# Unicode blocks for levels
 #▁▂▃▄▅▆▇█ ▁▂▃▄▅▆▇█
bars=(" " "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")
# bars=(" " "⡀" "⡄" "⡆" "⡇" "⡧" "⡷" "⣷" "⣿")

# Read cava output line by line
while read -r line; do
    out=""
    # Replace semicolons with spaces
    for value in $(echo $line | tr ";" " "); do
        # Scale 0–1000 → 0–8
        index=$(( (value * 8) / 1000 ))
        out+="${bars[$index]} "   # add a space after each bar
    done
    echo "$out"
done < /tmp/cava.fifo
