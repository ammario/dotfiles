# Defined in /tmp/fish.fK7WEU/tpforward.fish @ line 2
function tpforward
	pkill kubectl
	sleep 3s
	kubectl port-forward services/timescale 5432:5432 &
    kubectl port-forward services/registry 5000:5000
end
