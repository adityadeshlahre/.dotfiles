function gvm
    if test "$argv[1]" = "use"
        # Load env variables into Fish
        bass source ~/.gvm/scripts/gvm ';' gvm $argv
    else
        bash -c "source ~/.gvm/scripts/gvm && gvm $argv"
    end
end
