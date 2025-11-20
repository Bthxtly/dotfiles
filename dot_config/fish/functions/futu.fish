function futu -d "play season $1 episode $2"
    set -l season (printf "%02d" $argv[1])
    set -l episode (printf "%02d" $argv[2])

    cd ~/Videos/Futurama
    ls -1 | grep $season"x"$episode | xargs -I {} mpv {}
end
