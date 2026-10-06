#!/usr/bin/env bash

# --- Define functions ---
get_point() {
  point=$(slurp -p -f '%x %y')
  if [[ -z "$point" ]]; then
    notify-send "Cancelled"
    exit
  fi

  # scale the area so I can use it with xdotool
  scale=$(niri msg -j outputs | jq '.[].logical.scale' | grep -v null)

  scaled_point=$(python -c "print(*map(lambda x: int(float(x) * $scale), '$point'.split(' ')), sep=' ')")

  wl-copy $scaled_point
  notify-send "$scaled_point" "The point is copied to clipboard"
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
  region=$(slurp)
  if [[ -z "$region" ]]; then
    grim - | satty -f -
  else
    grim -g "$(slurp)" - | satty -f -
  fi
}

scan_qrcode() {
  info=$(grim -g "$(slurp)" - | qrtool decode -)
  notify-send "QR code info" "$info"
  echo $info | wl-copy
}

selections=(
  'Get_point_position'
  'Get_area_position'
  'Edit_screenshot'
  'Scan_QRcode'
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
${selections[3]}) scan_qrcode ;;
*) exit 0 ;;
esac
