# Defined in /tmp/fish.r7JTpY/list-env-ci.fish @ line 1
function list-env-ci
	gcloud compute instances list --project coder-dev-1 --filter="name:'env-ci*'"
end
