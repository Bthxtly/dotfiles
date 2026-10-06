#!/usr/bin/env bash

script_dir="$HOME/.config/niri/scripts"

# --- Define functions ---
toggle_opacity() {
  id=$(niri msg -j focused-window | jq '.id')
  niri msg action toggle-window-rule-opacity --id "$id"
}

# --- Menu via rofi ---
selections=(
  'Turn_off_monitors'
  'Reboot'
  'Reboot_to_Windows_10'
  'Toggle_focused_windows_opacity'
  'Toggle_light/dark_theme'
  'Power'
  'DMS_show'
  'Misc'
)

choices=""
for i in ${selections[*]}; do
  choices="$choices$i\n"
done

selected=$(echo -e "$choices" | rofi -i -dmenu -p "Choose an action")

# --- Execute selected function ---
case "$selected" in
${selections[0]}) niri msg action power-off-monitors ;;
${selections[1]}) systemctl reboot ;;
${selections[2]}) systemctl reboot --boot-loader-entry windows10.conf ;;
${selections[3]}) toggle_opacity ;;
${selections[4]}) $script_dir/switcher.sh ;;
${selections[5]}) $script_dir/actions/power.sh ;;
${selections[6]}) $script_dir/actions/dms.sh ;;
${selections[7]}) $script_dir/actions/misc.sh ;;
*) exit 0 ;;
esac
