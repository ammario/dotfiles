#!/bin/bash
set -ue

commit=$1

base_url=$(hub browse -u | grep -Poe "https://github.com/\w*/\w*" )

python -mwebbrowser "${base_url}/commit/$commit"
