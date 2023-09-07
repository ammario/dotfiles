function sl-pr-msg
	set ED (mktemp)
	set COMMIT_HASH (sl log | head -n 1 | awk '{print substr($2, 0, 8)}')
	set DATE (date +"%b %d - %I:%M%p")
	echo '#!/bin/bash
	echo "'"$DATE - $COMMIT_HASH"':" >> $1
	nvim $1
	' > $ED
	chmod +x $ED
	echo "writing temporary editor to $ED"
	export GH_EDITOR=$ED
	gh pr comment (sl-pr) $argv -e
end
