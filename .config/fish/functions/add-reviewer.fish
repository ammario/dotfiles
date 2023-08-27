function add-reviewer
	gh pr edit (sl-pr) --add-reviewer $argv[1]
end
