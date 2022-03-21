" Install Plugins
" Refer to https://github.com/junegunn/vim-plug#neovim
" for new box installation instructions.
call plug#begin(stdpath('data') . '/plugged')
	Plug 'arzg/vim-colors-xcode'
	Plug 'junegunn/vim-easy-align'
	Plug 'bling/vim-bufferline'
	Plug 'dag/vim-fish'
	Plug 'spolu/dwm.vim'
	" :G git commands.
	Plug 'tpope/vim-fugitive'
	" + - etc on the sidebar.
	Plug 'airblade/vim-gitgutter'
	" Folds, etc.
	Plug 'plasticboy/vim-markdown'
call plug#end()

" Clipboard
	set clipboard=unnamedplus	

" Text Editing
	" Start interactive EasyAlign in visual mode (e.g. vipga)
	xmap ga <Plug>(EasyAlign)

	" Start interactive EasyAlign for a motion/text object (e.g. gaip)
	nmap ga <Plug>(EasyAlign)

	" Align table in visual mode
	vmap <Leader>t :EasyAlign *\|<cr>

	" Clear search register
	nmap <Leader>s :let @/=""<cr>
	
	" Copy buffer then close it (git commit patches)
	nmap <Leader>c yG :bw<cr>

	" Reload file from disk
	nmap <Leader>e :e!<cr>

" Buffer Switching
	map <Leader>] :bn<cr>
	map <Leader>[ :bp<cr>

" Window Management
	" Use mouse to click on tabs and resize buffers.
	set mouse=n
	" Exit terminal mode more easily
	tnoremap <C-x> <C-\><C-n>

" Color
	let dark_theme='xcodedark'
	let light_theme='xcodelight'

	execute "colorscheme " . dark_theme
	execute "command Light colorscheme " . light_theme
	execute "command Dark colorscheme " . dark_theme

" Sidebar
	set number relativenumber

" Markdown
	" Disable auto folding
 	let g:vim_markdown_folding_disabled = 1
