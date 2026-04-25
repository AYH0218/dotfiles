#!/bin/sh

airport_device() {
  networksetup -listallhardwareports 2>/dev/null | awk '
    /Hardware Port: (Wi-Fi|AirPort)/ { found=1; next }
    found && /Device:/ { print $2; exit }
  '
}

current_ssid() {
  device="$(airport_device)"
  if [ -n "$device" ]; then
    ssid="$(networksetup -getairportnetwork "$device" 2>/dev/null | sed 's/^Current Wi-Fi Network: //')"
    if [ -n "$ssid" ] && [ "$ssid" != "You are not associated with an AirPort network." ]; then
      printf '%s\n' "$ssid"
      return 0
    fi
  fi

  system_profiler SPAirPortDataType 2>/dev/null | awk -F': ' '
    /Current Network Information:/ { getline; gsub(/^[[:space:]]+/, "", $1); sub(/:$/, "", $1); print $1; exit }
  '
}

wifi_status() {
  system_profiler SPAirPortDataType 2>/dev/null | awk -F': ' '
    /Status:/ { gsub(/^[[:space:]]+/, "", $2); print $2; exit }
  '
}

SSID="$(current_ssid)"
STATUS="$(wifi_status)"

if printf '%s\n' "$STATUS" | grep -Eq 'Off|Inactive|Not Connected'; then
  ICON="󰖪"
elif [ -n "$SSID" ]; then
  ICON="󰖩"
else
  ICON="󰖪"
fi

sketchybar --set "$NAME" icon="$ICON" label=""
