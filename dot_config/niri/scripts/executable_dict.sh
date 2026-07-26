#!/usr/bin/env bash

lookup_for_clipboard() {
  ydotool key 29:1 46:1 46:0 29:0                          # copy to clipboard with <C-c>
  env LIBGL_ALWAYS_SOFTWARE=1 goldendict $(wl-paste -n -p) # lookup dictionary instantly
}

open_window() {
  env LIBGL_ALWAYS_SOFTWARE=1 goldendict
}

close_window() {
  id=$(niri msg -j windows | jq '.[] | select(.app_id == "io.github.xiaoyifang.goldendict_ng") | .id')
  niri msg action close-window --id $id
}

toggle_window() {
  id=$(niri msg -j windows | jq '.[] | select(.app_id == "io.github.xiaoyifang.goldendict_ng") | .id')
  if [ -n "$id" ]; then
    niri msg action close-window --id $id
  else
    open_window
  fi
}

case $1 in
"lookup")
  lookup_for_clipboard
  ;;
"open")
  open_window
  ;;
"close")
  close_window
  ;;
"toggle")
  toggle_window
  ;;
esac
