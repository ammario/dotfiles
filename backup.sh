#!/bin/bash

set -ef 

# Backup important home folders.

backup_name="home_backup.tar.gz"

file_id="$(gdrive list | grep -Poe "(\S+)(?=\W+${backup_name}\W+bin)" | head -n 1)"

if [ -z $file_id ]; then
	echo "No ${backup_name} file found in drive! Create it with gdrive"
	exit 1;
fi

echo "Uploading ${backup_name} with ID ${file_id}"

fifo_name=$(mktemp -u)
mkfifo $fifo_name

tar -cvz - ~/Library/Preferences/GoLand* 2>/dev/null > $fifo_name &

gdrive update --name ${backup_name} $file_id $fifo_name

gdrive revision list $file_id
