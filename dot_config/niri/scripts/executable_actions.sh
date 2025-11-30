#!/usr/bin/env bash

# --- Define functions ---
get_point() {
  point=$(slurp -p -f '%x %y')
  if [[ -z "$point" ]]; then
    notify-send "Cancelled"
    exit
  fi

  wl-copy $point
  notify-send "$point" "The point is copied to clipboard"
}

get_area() {
  area=$(slurp -f '%w:%h:%x:%y')
  if [[ -z "$area" ]]; then
    notify-send "Cancelled"
    exit
  fi

  # scale the area so I can use it to crop screenshots with ffmpeg
  scale=$(niri msg -j outputs | jq '.[].logical.scale' | grep -v null)

  scaled_area=$(python -c "print(*map(lambda x: int(float(x) * $scale), '$area'.split(':')), sep=':')")

  wl-copy $scaled_area
  notify-send "$scaled_area" "The area is copied to clipboard"
}

toggle_theme() {
  ~/.config/niri/scripts/switcher.sh
}

edit_screenshot() {
  TMP_SCREENSHOT=/tmp/screenshot
  niri msg action screenshot-screen --path $TMP_SCREENSHOT
  sleep 1
  swappy -f $TMP_SCREENSHOT
}

show_media() {
  dms ipc call dash open media
}

show_overview() {
  dms ipc call dash open overview
}

show_weather() {
  dms ipc call dash open weather
}

show_wallpaper() {
  dms ipc call dash open wallpaper
}

suspend_sys() {
  systemctl suspend
}

time_now() {
  notify-send "Current Time" "$(date '+%Y-%m-%d %H:%M:%S')"
}

uptime_info() {
  notify-send "Uptime" "$(uptime -p)"
}

# --- Menu via rofi ---
point='Get point position'
area='Get area position'
screenshot='Edit screenshot'
media='Show current media'
overview='Show overview'
weather='Show weather'
wallpaper='Show wallpaper'
suspend='Suspend'
theme='Toggle light/dark theme'
choices="$point\n$area\n$screenshot\n$theme\n$media\n$overview\n$weather\n$wallpaper\n$suspend\nTime\nUptime"

selected=$(echo -e "$choices" | rofi -i -dmenu -p "Choose an action")

# --- Execute selected function ---
case "$selected" in
$point) get_point ;;
$area) get_area ;;
$screenshot) edit_screenshot ;;
$theme) toggle_theme ;;
$media) show_media ;;
$overview) show_overview ;;
$weather) show_weather ;;
$wallpaper) show_wallpaper ;;
$suspend) suspend_sys ;;
"Time") time_now ;;
"Uptime") uptime_info ;;
*) exit 0 ;;
esac
