#!/bin/bash

# get the current theme
theme=$(dms ipc theme getMode)

niri_colors=~/.config/niri/colors.kdl
backdrop_color_line=$(awk '$1 == "backdrop-color" {print NR}' $niri_colors)
# Check the value of $theme and do the proper sed {{{
if [[ "$theme" == "light" ]]; then
  mode="1 s/light/dark/"
  spicetify_mode="10 s/dawn/moon/"
  niri_color_mode="$backdrop_color_line s/FAF4ED/232136/"
elif [[ "$theme" == "dark" ]]; then
  mode="1 s/dark/light/"
  spicetify_mode="10 s/moon/dawn/"
  niri_color_mode="$backdrop_color_line s/232136/FAF4ED/"

  # fix gtk-css issue with zathura
  gtk3_path=~/.config/gtk-3.0
  awk 'NR<5 || NR >7803 {print $0}' "$gtk3_path"/gtk.css >/tmp/gtk.css
  mv /tmp/gtk.css "$gtk3_path"/gtk.css
fi

# niri
sed -i "$niri_color_mode" ~/.config/niri/colors.kdl
# spotify
sed -i "$spicetify_mode" ~/.config/spicetify/config-xpui.ini
# nvim
sed -i "$mode" ~/.config/nvim/current_theme.vim
# kitty
sed -i "$mode" ~/.config/kitty/current_theme.conf
# rofi
sed -i "$mode" ~/.config/rofi/current_theme.rasi
# zathura
sed -i "$mode" ~/.config/zathura/current_theme.conf
# }}}

# quickshell, system, and wallpaper {{{
dms ipc theme toggle
# }}}

# reload kitty {{{
# Get the PID of the Kitty process
kitty_pid=$(pgrep kitty)

# Check if Kitty is running
if [ -n "$kitty_pid" ]; then
  # Send SIGUSR1 to the Kitty process
  for p in $kitty_pid; do
    kill -SIGUSR1 "$p" &
  done
fi
# }}}

# relaod zathrua {{{
zathura_pid=$(pidof zathura)
for p in $zathura_pid; do
  busctl --user call org.pwmt.zathura.PID-$p /org/pwmt/zathura org.pwmt.zathura SourceConfig &
done
# }}}

# reload nvim {{{
# Get neovim sockets files
nvim_sockets=$(ls /run/user/1000/nvim*)

# Find all Neovim sockets and send the source command
for socket in $nvim_sockets; do
  if [ -S "$socket" ]; then
    # echo $socket
    nvim --server "$socket" --remote-send \
      '<C-\><C-N>:source $HOME/.config/nvim/current_theme.vim<CR>:<ESC>' >/dev/null &
  fi
done
# }}}

# apply spicetify and restart spotify {{{
spicetify apply -n
playing_status=$(playerctl status -p spotify)
killall spotify
sleep 2
env LD_PRELOAD=/usr/lib/spotify-adblock.so spotify --enable-features=UseOzonePlatform --ozone-platform=wayland
sleep 4
if [[ $playing_status == "Playing" ]]; then
  playerctl play -p spotify
fi
# }}}

# vim:foldmethod=marker:foldlevel=0
