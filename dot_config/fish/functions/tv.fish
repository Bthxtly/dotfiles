function tv -d "play my favorate TV series"
    set -l tvname "$argv[1]*"
    set -l season (printf "%02d" $argv[2])
    set -l episode (printf "%02d" $argv[3])
    set -l video

    if string match $tvname futurama
        set video (fd $season"x"$episode ~/Videos/Futurama)

    else if string match $tvname simpsons
        set video (fd $season"E"$episode ~/Videos/TheSimpsonsS01/)

    else if string match $tvname lamicageniale
        set video (fd $season"E"$episode ~/Videos/LAmicaGeniale/)

    else
        echo "Unknown TV name"
        return
    end

    mpv $video
end
