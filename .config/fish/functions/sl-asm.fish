function sl-asm --description 'amend submit and edit message'
	sl am && sl pr submit && sl-pr-msg --edit-last
end
