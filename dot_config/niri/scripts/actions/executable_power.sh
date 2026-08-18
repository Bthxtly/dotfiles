#!/usr/bin/env bash

selections=(
  'Suspend'
  'Shutdown'
  'Hibernate'
)

choices=""
for i in ${selections[*]}; do
  choices="$choices$i\n"
done

selected=$(echo -e "$choices" | rofi -i -dmenu -p "Choose a sub-action")

case "$selected" in
${selections[0]}) systemctl suspend ;;
${selections[1]}) shutdown now ;;
${selections[2]}) systemctl hibernate ;;
*) exit 0 ;;
esac
