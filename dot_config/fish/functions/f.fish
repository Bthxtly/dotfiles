# find and open files under current directory
function f
    set -l file $(fd --type f | fzf)

    if test -z $file
        return
    end

    set -l mime $(file --brief --dereference --mime -- "$file")

    if echo $mime | rg -q '^text/'
        nvim $file
    else
        if echo $mime | rg -q '^image/'
            imv $file
        else
            xdg-open $file
        end
    end
end
