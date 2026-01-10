# Source - https://superuser.com/a
# Posted by terdon, modified by community. See post 'Timeline' for change history
# Retrieved 2025-11-23, License - CC BY-SA 4.0

function stopwatch
    set start (date +%s)
    while true
        set time (math (date +%s) - $start)
        printf '%s\r' (date -u -d "@$time" +%H:%M:%S)
        sleep 0.1
    end
end
