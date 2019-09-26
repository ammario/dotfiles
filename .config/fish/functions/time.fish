# Defined in - @ line 1
function time --description alias\ time\ time\ -f\ \"real\\t\%e\\nuser\\t\%U\\nsys\\t\%S\"
	command time -f "real\t%e\nuser\t%U\nsys\t%S" $argv;
end
