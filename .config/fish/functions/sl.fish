function sl
    set EXEC (which sl)
    $EXEC $argv 2>&1 | grep -v 'cannot change locale'
    return $status
end