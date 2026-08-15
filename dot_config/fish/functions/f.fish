# find and open files under current directory
function f
    set -l file $(fd --type f | fzf)

    if test -z $file
        return
    end

    if file --brief --dereference --mime -- "$file" | rg -q '^text/'
        nvim $file
    else
        xdg-open $file
    end
end
