# Defined in /tmp/fish.L5CmtF/cegofmt.fish @ line 2
function cegofmt
	cd (groot)
  go install go.coder.com/go-tools/cmd/goimports
  git ls-files '*.go' | xargs -I % -n 16 -P (nproc) "$GOPATH"/bin/goimports -w -local=go.coder.com
end
