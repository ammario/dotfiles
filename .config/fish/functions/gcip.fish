# Defined in /var/folders/fs/55k0056d2rq090642gnvp5t80000gn/T//fish.19Bzgq/gcip.fish @ line 1
function gcip --argument instance
	gcloud --format=json compute instances describe $instance | jq -r ".networkInterfaces[0].accessConfigs[0].natIP"
end
