set -x LANG en_US.UTF-8

# assign neovim as default editor
set -x VISUAL nvim
set -x EDITOR nvim

# config globle variables
fish_add_path ~/.local/share/gem/ruby/3.4.0/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin

set -x QT_QPA_PLATFORM wayland
set -x QT_QPA_PLATFORMTHEME qt5ct
set -x SDL_VIDEODRIVER wayland

# colorful man page
set -x MANPAGER "bat -p"

# set go path
set -x GOPATH $HOME/.local/share/go

# less UTF-8 supports
set -x LESSCHARSET utf-8

# run gvim in wayland
set -x GVIM_ENABLE_WAYLAND 1

# set proper Android SKD direction
set -x ANDROID_HOME $HOME/.local/share/Android

# use fzf config file
set -x FZF_DEFAULT_OPTS_FILE $HOME/.config/fzf/fzfrc
set -x FZF_CTRL_R_OPTS "--preview-window=hidden"
