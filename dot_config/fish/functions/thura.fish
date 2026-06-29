function thura
    # open files with zathura and then disown it
    zathura $argv 2>/dev/null &
    disown
end
