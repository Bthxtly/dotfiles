# substitube x with y globally
function sg
    set -l from $argv[1]
    set -l to $argv[2]

    rg $from -l | xargs -I {} sed -i "s#$from#$to#g" {}
end
