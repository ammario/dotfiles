# Defined in /tmp/fish.AqNH84/cefmt.fish @ line 2
function cefmt
	pushd (groot)
	ci/steps/fmt.sh
	popd
end
