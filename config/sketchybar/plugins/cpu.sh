#!/bin/sh

CPU_USAGE="$(top -l 1 -n 0 2>/dev/null | awk -F'[:,%]' '/CPU usage:/ { printf "%.0f", $2 + $4; exit }')"

if [ -z "$CPU_USAGE" ]; then
  CPU_USAGE="--"
fi

sketchybar --set "$NAME" label="${CPU_USAGE}%"
