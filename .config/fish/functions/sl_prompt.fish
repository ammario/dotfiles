function sl_prompt
    set LOG_TEMPLATE '{node}|{activebookmark}|{branch}|{github_pull_request_number}|{diffstat}|'
    set LOG (sl log -l 1 --template $LOG_TEMPLATE 2>/tmp/sl_prompt_error)
    if test $status -ne 0
        return 0
    end

    set_color $grey
    echo -n " ("
    set_color $green

    set PR_NUM (echo $LOG | awk -v FS='|' '{printf("%s", $4)}' | tr -d '[blank]')
    set COMMIT (echo $LOG | awk -v FS='|' '{printf("%s", substr($1, 0, 8))}')
    set BOOKMARK (echo $LOG | awk -v FS='|' '{printf("%s", $2)}')



    if test -n "$PR_NUM"
        echo -n '#'
        echo -n $PR_NUM
    else if test -n "$BOOKMARK"
        echo -n $BOOKMARK
    else
        echo -n "@"
        echo -n $COMMIT
    end

    set_color $grey
    echo -n ")"
end