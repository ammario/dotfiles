function sl-commit
    echo (sl log | head -n 1 | awk '{print $2}')
end