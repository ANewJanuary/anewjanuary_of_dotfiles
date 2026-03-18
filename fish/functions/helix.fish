function helix
    # If we have file arguments
    if set -q argv[1]
        # Check if we're in Zellij
        if set -q ZELLIJ
            # Send the :open command to helix
            zellij --session def1 action write-chars ":open $argv[1]"
            zellij --session def1 action write 13
        else
            # Not in Zellij, run normally
            command hx $argv
        end
    end
end
