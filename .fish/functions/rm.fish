function rm
    echo "WARNING: About to delete $argv"
    read -P "Are you sure? (y/N) " confirm
    if test "$confirm" = "y" -o "$confirm" = "Y"
        command rm $argv
    else
        echo "Aborted."
    end
end
