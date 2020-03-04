" Install Plugins
call plug#begin(stdpath('data') . '/plugged')
	Plug 'arzg/vim-colors-xcode'
	Plug 'junegunn/vim-easy-align'
	Plug 'bling/vim-bufferline'
call plug#end()

" Clipboard
	set clipboard=unnamedplus	

" Text Editing
	" Start interactive EasyAlign in visual mode (e.g. vipga)
	xmap ga <Plug>(EasyAlign)

	" Start interactive EasyAlign for a motion/text object (e.g. gaip)
	nmap ga <Plug>(EasyAlign)

" Buffer Switching
	map <Leader>] :bn<cr>
	map <Leader>[ :bp<cr>

" Color
	let dark_theme='xcodedark'
	let light_theme='xcodelight'

	execute "colorscheme " . dark_theme
	execute "command Light colorscheme " . light_theme
	execute "command Dark colorscheme " . dark_theme

" Sidebar
	set number relativenumber
