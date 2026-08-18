#!/usr/bin/env bash

selections=(
  'Show current media'
  'Show overview'
  'Show weather'
  'Show wallpaper'
)

choices=""
for i in ${selections[*]}; do
  choices="$choices$i\n"
done

selected=$(echo -e "$choices" | rofi -i -dmenu -p "Choose a sub-action")

case "$selected" in
${selections[0]})
  dms ipc call dash open media
  ;;
${selections[1]})
  dms ipc call dash open overview
  ;;
${selections[2]})
  dms ipc call dash open weather
  ;;
${selections[3]})
  dms ipc call dash open wallpaper
  ;;
*) exit 0 ;;
esac
