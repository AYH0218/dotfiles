#!/bin/sh

SOURCE="$(defaults read com.apple.HIToolbox AppleSelectedInputSources 2>/dev/null)"
LAYOUT_ID="$(defaults read com.apple.HIToolbox AppleCurrentKeyboardLayoutInputSourceID 2>/dev/null)"

if printf '%s\n' "$SOURCE" | grep -q '"Input Mode" = "com.apple.inputmethod.Japanese"'; then
  ICON="󰌌"
  LABEL="JP"
elif printf '%s\n' "$SOURCE" | grep -Eq 'KeyboardLayout Name" = "(ABC|U\.S\.)"|com.apple.keylayout.ABC|com.apple.keylayout.US' \
  || printf '%s\n' "$LAYOUT_ID" | grep -Eq '^com\.apple\.keylayout\.(ABC|US)$'; then
  ICON="󰌌"
  LABEL="EN"
else
  ICON="󰌌"
  LABEL="IME"
fi

sketchybar --set "$NAME" icon="$ICON" label="$LABEL"
