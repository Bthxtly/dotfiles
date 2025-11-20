if status is-interactive
    # shell integrations
    fzf --fish | source
    thefuck --alias | source
    zoxide init fish | source
    niri completions fish | source

    # clear greeting message
    set -U fish_greeting

    # # display a randomly selected tldr page
    # tldr --quiet $(tldr --quiet --list | shuf -n1)
end
