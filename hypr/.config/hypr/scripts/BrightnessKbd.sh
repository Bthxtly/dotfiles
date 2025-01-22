#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for keyboard backlights (if supported) using brightnessctl

iDIR="$HOME/dotfiles/hypr/.config/hypr/scripts/icons"

# Get keyboard brightness
get_kbd_backlight() {
  echo $(light | cut -d. -f1)
}

# Get icons
get_icon() {
  current=$(get_kbd_backlight)
  if [ "$current" -le "20" ]; then
    icon="$iDIR/brightness-20.png"
  elif [ "$current" -le "40" ]; then
    icon="$iDIR/brightness-40.png"
  elif [ "$current" -le "60" ]; then
    icon="$iDIR/brightness-60.png"
  elif [ "$current" -le "80" ]; then
    icon="$iDIR/brightness-80.png"
  else
    icon="$iDIR/brightness-100.png"
  fi
}
# Notify
notify_user() {
  notify-send -e -h string:x-canonical-private-synchronous:brightness_notif -h int:value:$current -u low -i "$icon" "Keyboard Brightness : $current%"
}

# Change brightness
change_kbd_backlight() {
  light -"$1" "$2" && get_icon && notify_user
}

# Execute accordingly
case "$1" in
"--get")
  get_kbd_backlight
  ;;
"--inc")
  change_kbd_backlight "A" "5"
  ;;
"--dec")
  change_kbd_backlight "U" "5"
  ;;
*)
  get_kbd_backlight
  ;;
esac
