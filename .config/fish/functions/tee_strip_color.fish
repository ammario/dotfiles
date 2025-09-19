function tee_strip_color --description 'Show colour, save plain text'
    set -l outfile $argv[1]
    or begin
        echo "Usage: tee_strip_color OUTFILE [command …]  (or pipe into it)" >&2
        return 1
    end
    set -e argv[1]

    # Build the stripping branch once
    set -l strip "sed -E 's/\\x1b\\[[0-9;]*m//g' > $outfile"

    if test (count $argv) -eq 0
        # No command → use stdin, work as a filter
        tee >(eval $strip)
    else
        # Command provided → run it first
        command $argv | tee >(eval $strip)
    end
end
