set -x LANG en_US.UTF-8

# assign neovim as default editor
set -x VISUAL nvim
set -x EDITOR nvim

# config globle variables
fish_add_path ~/.local/share/gem/ruby/3.4.0/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin

set -x HYPRSHOT_DIR $HOME/Pictures/Screenshots
set -x QT_QPA_PLATFORM wayland
set -x SCREENSHOT_TOOL grim
set -x SDL_VIDEODRIVER wayland

# colorful man page
set -x MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

# set go path
set -x GOPATH $HOME/Applications/go

# less UTF-8 supports
set -x LESSCHARSET utf-8

# run gvim in wayland
set -x GVIM_ENABLE_WAYLAND 1
