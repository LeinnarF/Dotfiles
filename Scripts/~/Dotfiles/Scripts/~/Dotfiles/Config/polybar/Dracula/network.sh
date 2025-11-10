#!/bin/bash

# Check if we have a default route (means network is up)
if ! ip route | grep -q "default"; then
    echo "󰖪"   # disconnected
    exit 0
fi

# Now check internet connectivity by pinging Google DNS
if ping -c 1 google.com >/dev/null; then
    echo "󰖩"
else
    echo "󰖪"
fi
