#!/bin/bash

# ===get the current theme {{{
line=$(<"$HOME/dotfiles/nvim/.config/nvim/current_theme.vim")
theme=$(echo $line | cut -d= -f2)
echo $theme
# }}}

# Check the value of $theme and do the proper sed
if [[ "$theme" == "light" ]]; then
    echo "light to dark"
    sed -i "1 s/light/dark/" ~/dotfiles/nvim/.config/nvim/current_theme.vim
    sed -i "1 s/light/dark/" ~/dotfiles/kitty/.config/kitty/current_theme.conf
    sed -i "1 s/light/dark/" ~/dotfiles/rofi/.config/rofi/config.rasi
    # sed -i "22 s/Light/Dark/" ~/.config/fcitx5/conf/classicui.conf
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark

elif [[ "$theme" == "dark" ]]; then
    echo "dark to light"
    sed -i "1 s/dark/light/" ~/dotfiles/nvim/.config/nvim/current_theme.vim
    sed -i "1 s/dark/light/" ~/dotfiles/kitty/.config/kitty/current_theme.conf
    sed -i "1 s/dark/light/" ~/dotfiles/rofi/.config/rofi/config.rasi
    # sed -i "22 s/Dark/Light/" ~/.config/fcitx5/conf/classicui.conf
    gsettings set org.gnome.desktop.interface color-scheme default

else
    echo "Error"
    exit 1
fi

# ===reload nvim {{{
# Get neovim sockets files
nvim_sockets=$(ls /run/user/1000/nvim*)

# Find all Neovim sockets and send the source command
for socket in $nvim_sockets; do
    if [ -S "$socket" ]; then
        echo $socket
        nvim --server "$socket" --remote-send '<C-\><C-N>:source $MYVIMRC<CR>:<ESC>' >/dev/null
    fi
done
# }}}

# ===reload kitty {{{
# Get the PID of the Kitty process
kitty_pid=$(pgrep kitty)

# Check if Kitty is running
if [ -n "$kitty_pid" ]; then
    # Send SIGUSR1 to the Kitty process
    for p in $kitty_pid; do
        kill -SIGUSR1 "$p"
        echo "SIGUSR1 sent to Kitty (PID: $p)"
    done
else
    echo "Kitty is not running."
fi
# }}}

# # ===reload fcitx5 {{{ 
# if [[ "$(ps aux | grep -E '[0-9]{1,2}:[0-9]{1,2} fcitx5' | grep -o 'fcitx5')" = "fcitx5" ]]; then
#     fcitx5 -r &
# fi
# # }}}

# vim:foldmethod=marker
