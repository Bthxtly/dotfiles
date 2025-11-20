function fzf --wraps="fzf"
    # Paste contents of preferred variant here

    command fzf --bind=ctrl-e:preview-down,ctrl-y:preview-up \
                --reverse \
                --color=16 \
                --preview 'pygmentize -f terminal {}' \
                $argv
end
