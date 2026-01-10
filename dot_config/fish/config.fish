if status is-interactive
    # shell integrations
    fzf --fish | source
    zoxide init fish | source
    thefuck --alias | source
    niri completions fish | source

    # clear greeting message
    set -U fish_greeting

    set --global fish_key_bindings fish_default_key_bindings

    # # display a randomly selected tldr page
    # tldr --quiet $(tldr --quiet --list | shuf -n1)
end
