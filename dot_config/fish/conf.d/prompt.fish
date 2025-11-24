# name: Arrow
# author: Bruno Ferreira Pinto, Pawel Zubrycki

function fish_prompt
    set -l last_status $status

    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l green (set_color -o green)
    set -l blue (set_color -o blue)
    set -l normal (set_color normal)

    set -l arrow "$green➜ "
    if test $last_status != 0
        set arrow "$red✗ "
    end

    set -l cwd $cyan(prompt_pwd)

    # https://asciinema.org/a/608188
    # Show any backgrounded job, since I get confused about whether I've backgrounded nvim all the time.
    # jobs -c shows the command name only, not the PID or anything.
    set -l suspended_job_command (jobs -c | awk 'NR>0 {printf "%s%s", sep, $0; sep=" "} END {print ""}')

    # I have an alias which uses fd, fzf and xargs together to find a file and open in nvim
    if test $suspended_job_command = "fd fzf xargs"
        set suspended_job_command nvim
    end

    if test -n $suspended_job_command
        set suspended_job " "$(set_color brmagenta)"["$suspended_job_command"]"$(set_color normal)
    end

    string join '' -- $arrow $cwd $normal $suspended_job ' '
end

function fish_right_prompt
    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l green (set_color -o green)
    set -l blue (set_color -o blue)
    set -l normal (set_color normal)

    # helper functions
    if not set -q -g __fish_arrow_functions_defined
        set -g __fish_arrow_functions_defined
        function _git_branch_name
            set -l branch (git symbolic-ref --quiet HEAD 2>/dev/null)
            if set -q branch[1]
                echo (string replace -r '^refs/heads/' '' $branch)
            else
                echo (git rev-parse --short HEAD 2>/dev/null)
            end
        end

        function _is_git_dirty
            not command git diff-index --cached --quiet HEAD -- &>/dev/null
            or not command git diff --no-ext-diff --quiet --exit-code &>/dev/null
        end

        function _is_git_repo
            type -q git
            or return 1
            git rev-parse --git-dir >/dev/null 2>&1
        end

        function _hg_branch_name
            echo (hg branch 2>/dev/null)
        end

        function _is_hg_dirty
            set -l stat (hg status -mard 2>/dev/null)
            test -n "$stat"
        end

        function _is_hg_repo
            fish_print_hg_root >/dev/null
        end

        function _repo_branch_name
            _$argv[1]_branch_name
        end

        function _is_repo_dirty
            _is_$argv[1]_dirty
        end

        function _repo_type
            if _is_hg_repo
                echo hg
                return 0
            else if _is_git_repo
                echo git
                return 0
            end
            return 1
        end
    end

    set -l repo_info
    if set -l repo_type (_repo_type)
        set -l repo_branch $red(_repo_branch_name $repo_type)
        set repo_info "$blue $repo_type:($repo_branch$blue)"

        if _is_repo_dirty $repo_type
            set -l dirty "$yellow ✗"
            set repo_info "$repo_info$dirty"
        end
    end

    string join '' -- $repo_info " " (set_color --bold blue) (date +%T)
end

# function fish_prompt --description 'Write out the prompt'
#     set -l last_pipestatus $pipestatus
#     set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
#     set -l normal (set_color normal)
#     set -q fish_color_status
#     set -l color_cwd $fish_color_cwd
#     set -l suffix '>'
#     or set -g fish_color_status red
#
#     # Write pipestatus
#     # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
#     set -l bold_flag --bold
#     set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
#     if test $__fish_prompt_status_generation = $status_generation
#         set bold_flag
#     end
#     set __fish_prompt_status_generation $status_generation
#     set -l status_color (set_color $fish_color_status)
#     set -l statusb_color (set_color $bold_flag $fish_color_status)
#     set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
#
#     echo -n -s (set_color $color_cwd) (prompt_pwd) $normal " "$prompt_status $suffix " "
# end
#
# function fish_right_prompt
#   string join '' -- (set_color red) (fish_git_prompt) (set_color normal) " " (date +%H:%M)
# end
