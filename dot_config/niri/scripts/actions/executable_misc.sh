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

edit_screenshot() {
  TMP_SCREENSHOT=/tmp/screenshot
  niri msg action screenshot-screen --path $TMP_SCREENSHOT
  sleep 1
  swappy -f $TMP_SCREENSHOT
}

selections=(
  'Get_point_position'
  'Get_area_position'
  'Edit_screenshot'
)

choices=""
for i in ${selections[*]}; do
  choices="$choices$i\n"
done

selected=$(echo -e "$choices" | rofi -i -dmenu -p "Choose a sub-action")

case "$selected" in
${selections[0]}) get_point ;;
${selections[1]}) get_area ;;
${selections[2]}) edit_screenshot ;;
*) exit 0 ;;
esac
