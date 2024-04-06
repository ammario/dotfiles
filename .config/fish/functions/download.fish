function download
	pushd ~/Downloads
	wget $argv[1]
	popd
end
