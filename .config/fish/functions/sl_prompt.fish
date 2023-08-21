function sl_prompt
    function csort
        fold -w1 | command sort | tr -d '\n'
    end

    # run in background to avoid slowing down prompt
    set TMP (mktemp -d)
    set STATUS_PATH $TMP/status
    sl st 2>/dev/null | \
        awk '{unique[$1] = 1} END {for (i in unique) {printf("%s", i)} print ""}' | csort \
        > $STATUS_PATH &

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

        if (bookmark != "") {
            printf "%s", bookmark
        } else if (remote != "") {
            printf "= %s", remote
        } else if (pr_num != "") {
            printf "#%s", pr_num
        } else {
            printf "@%s", commit
        }
    }'

    wait;
    if test -s $STATUS_PATH
        set_color $pink
        set symbols (cat $STATUS_PATH)
        if test -n "$symbols"
            echo -n " $symbols"
        end
    end

    set_color $grey
    echo -n ")"
    set_color $reset_color
    rm -rf $TMP
end