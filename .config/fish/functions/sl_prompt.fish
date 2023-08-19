function sl_prompt
    # Test that .sl directory parents cwd.
    sl st 2>/dev/null > /dev/null 
    if test $status -ne 0
        return 0
    end
    set PR_NUM (sl-prnum)
    set_color $grey
    echo " ("
    set_color $green
    echo -n "#$PR_NUM"
    set_color $grey
    echo ")"
end