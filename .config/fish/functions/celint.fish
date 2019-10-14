# Defined in /tmp/fish.fvSyEf/celint.fish @ line 1
function celint
	pushd (groot)
	ci/steps/lint.sh
	popd
end
