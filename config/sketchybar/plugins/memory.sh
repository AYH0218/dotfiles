#!/bin/sh

MEMORY_USAGE="$(
  memory_pressure 2>/dev/null | awk -F': ' '
    /System-wide memory free percentage:/ {
      gsub(/%/, "", $2)
      printf "%.0f", 100 - $2
      exit
    }
  '
)"

if [ -z "$MEMORY_USAGE" ]; then
  MEMORY_USAGE="$(vm_stat 2>/dev/null | awk '
    /Pages free/ {
      gsub(/[^0-9]/, "", $3)
      free = $3
    }
    /Pages active/ {
      gsub(/[^0-9]/, "", $3)
      active = $3
    }
    /Pages inactive/ {
      gsub(/[^0-9]/, "", $3)
      inactive = $3
    }
    /Pages speculative/ {
      gsub(/[^0-9]/, "", $3)
      speculative = $3
    }
    /Pages wired down/ {
      gsub(/[^0-9]/, "", $4)
      wired = $4
    }
    /Pages occupied by compressor/ {
      gsub(/[^0-9]/, "", $5)
      compressed = $5
    }
    END {
      total = active + inactive + speculative + wired + compressed + free
      used = active + wired + compressed
      if (total > 0) {
        printf "%.0f", (used / total) * 100
      }
    }
  ')"
fi

if [ -z "$MEMORY_USAGE" ]; then
  MEMORY_USAGE="--"
fi

sketchybar --set "$NAME" label="${MEMORY_USAGE}%"
