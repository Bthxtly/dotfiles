#!/usr/bin/env bash

selections=(
  'Lock'
  'Suspend'
  'Shutdown'
  'Hibernate'
  'Reboot'
  'Reboot_to_Windows_10'
)

choices=""
for i in ${selections[*]}; do
  choices="$choices$i\n"
done

selected=$(echo -e "$choices" | rofi -i -dmenu -p "Choose a sub-action")

case "$selected" in
${selections[0]}) loginctl lock-session ;;
${selections[1]}) systemctl suspend ;;
${selections[2]}) shutdown now ;;
${selections[3]}) systemctl hibernate ;;
${selections[4]}) systemctl reboot ;;
${selections[5]}) systemctl reboot --boot-loader-entry windows10.conf ;;
*) exit 0 ;;
esac
