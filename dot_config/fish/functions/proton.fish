function proton
    set -x STEAM_COMPAT_CLIENT_INSTALL_PATH ~/.local/share/Steam/
    set -x STEAM_COMPAT_DATA_PATH ~/.local/share/Steam/steamapps/compatdata
    ~/.steam/root/steamapps/common/Proton\ -\ Experimental/proton run $argv
end
