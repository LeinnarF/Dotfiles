#!/bin/bash
# Print CPU temperature in Celsius (AMD Ryzen)
sensors | grep "Tctl" | awk '{print int($2)}' | tr -d '+'
