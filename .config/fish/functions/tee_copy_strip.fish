function tee_copy_strip
    set tmp (mktemp)
    cat > $tmp
    cat -p --paging=never $tmp
    sed -E 's/\x1b\[[0-9;]*m//g' $tmp | pbcopy
    rm $tmp
end
