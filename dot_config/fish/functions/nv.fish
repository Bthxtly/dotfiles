function nv
    # open files with neovide and then disown it
    neovide $argv 2>/dev/null &
    disown
end
