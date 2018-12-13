#!/bin/bash
confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Delete [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}


for branch in `git branch --merged | egrep -v "(^\*|master|develop)"`; do
	confirm "Are you sure you want to delete $branch?" && git branch -d $branch
done

