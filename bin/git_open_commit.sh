#!/bin/bash
set -ue

commit=$1

python -mwebbrowser "$(hub browse -u)/commit/$commit"
