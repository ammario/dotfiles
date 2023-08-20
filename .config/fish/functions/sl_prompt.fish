function sl_prompt
    # run in background to avoid slowing down prompt
    set TMP (mktemp -d)
    set STATUS_PATH $TMP/status
    sl st 2>/dev/null > $STATUS_PATH &

    set LOG_TEMPLATE '{node}|{activebookmark}|{branch}|{github_pull_request_number}|{diffstat}|{remotenames}'
    set LOG (sl log -l 1 --template $LOG_TEMPLATE 2>/tmp/sl_prompt_error)
    if test $status -ne 0
        return 0
    end

    set_color $grey
    echo -n " ("
    set_color $green

    # Each call to awk was taking 0.1s, which became quite noticeable.
    echo $LOG | awk -F'|' '
    {
        pr_num = $4; gsub(/[ \t]+$/, "", pr_num)
        commit = substr($1, 0, 8)
        bookmark = $2
        remote = $6
        sub("remote/", "", remote)

        if (pr_num != "") {
            printf "#%s", pr_num
        } else if (bookmark != "") {
            printf "%s", bookmark
        } else if (remote != "") {
            printf "=️ %s", remote
        } else {
            printf "@%s", commit
        }
    }'

    wait;
    if test -s $STATUS_PATH
        set_color $pink
        echo -n " *"
    end

    set_color $grey
    echo -n ")"
    set_color $reset_color
    rm -rf $TMP
end