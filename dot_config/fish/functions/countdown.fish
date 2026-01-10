# Source - https://superuser.com/a
# Posted by terdon, modified by community. See post 'Timeline' for change history
# Retrieved 2025-11-23, License - CC BY-SA 4.0

function countdown
    set start (math (date '+%s') + $argv[1])
    while test $start -ge (date +%s)
        set time (math $start - (date +%s))
        printf '%s\r' (date -u -d "@$time" +%H:%M:%S)
        sleep 0.1
    end

    while true
        printf \a
    end
end
