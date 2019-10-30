# Defined in /tmp/fish.MPGaPa/cegofmt.fish @ line 2
function cegofmt
	pushd (groot)
	  go install go.coder.com/go-tools/cmd/goimports
	  git ls-files '*.go' | xargs -I % -n 16 -P (nproc) "$GOPATH"/bin/goimports -w -local=go.coder.com
	  popd
end
