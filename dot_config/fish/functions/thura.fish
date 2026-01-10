function thura
    # open files with zathura and then disown it
    zathura $argv &
    disown
end
