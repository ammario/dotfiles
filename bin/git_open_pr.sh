#!/bin/bash
branch=$(git rev-parse --abbrev-ref HEAD)

if [ "$?" -eq 0 ]; then
	url=$(hub pr list -f "%U\n" -h $branch)
fi

if [ -z $url ]; then
	url=$(hub browse -u)
fi

python -mwebbrowser $url >/dev/null
