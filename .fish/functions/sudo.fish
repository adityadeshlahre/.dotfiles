function sudo
    if test (count $argv) -ge 2 -a "$argv[1]" = "rm"
        set cmd (string join ' ' $argv)
        
        # Block dangerous combinations
        if string match -q '*rm -rf /*' "$cmd"
            echo "❌ Dangerous command blocked: '$cmd'"
            echo "Refusing to execute 'rm -rf /...'"
            return 1
        else if string match -q '*--no-preserve-root*' "$cmd"
            echo "❌ Command uses --no-preserve-root. Blocked: '$cmd'"
            return 1
        else if string match -q '*rm -rf /' "$cmd"
            echo "❌ Attempt to delete root directory. Blocked: '$cmd'"
            return 1
        end
        
        # Prompt on general sudo rm
        echo "⚠️  Sudo rm detected: $cmd"
        read -P "Are you sure you want to run this? (y/N): " confirm
        if test "$confirm" = "y" -o "$confirm" = "Y"
            command sudo $argv
        else
            echo "Aborted."
        end
    else
        command sudo $argv
    end
end
