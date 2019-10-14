function get-namespace
	kubectl config view --minify --output 'jsonpath={..namespace}'
end
