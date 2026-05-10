function dud -d "du for a directory and sort"
    du -sh $argv[1]/* | sort -h
end
