if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=/home/ammar/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

	let go_ft_opt = { 'on_ft': 'go' }
	call dein#add('~/.cache/dein')
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('zchee/deoplete-go', go_ft_opt)
	call dein#add('fatih/vim-go', go_ft_opt)
	call dein#add('jodosha/vim-godebug', go_ft_opt)
	call dein#add('fatih/vim-go')
	call dein#add('tpope/vim-fugitive')
	call dein#add('rust-lang/rust.vim')
	call dein#add('racer-rust/vim-racer')
	call dein#add('leafgarland/typescript-vim')
	call dein#add('tpope/vim-surround' )
	call dein#add('tpope/vim-repeat')
	call dein#add('uarun/vim-protobuf')
	" On probation until relative path configuration is figured out.
	" call dein#add('itchyny/lightline.vim') 
  	call dein#add('Shougo/denite.nvim')
	call dein#add('airblade/vim-gitgutter') " git diff signs in the gutter
	call dein#add('w0rp/ale')
	call dein#add('dracula/vim')
	call dein#add('Shougo/neosnippet.vim')
	call dein#add('Shougo/neosnippet-snippets')
	call dein#add('tpope/vim-commentary')
	call dein#add('easymotion/vim-easymotion')
	call dein#add('terryma/vim-smooth-scroll')
	call dein#add('joshdick/onedark.vim')
	call dein#add('NLKNguyen/papercolor-theme')
	call dein#add('jceb/vim-orgmode')
	call dein#add('durandj/bazel.vim')
	call dein#add('hashivim/vim-terraform')
	call dein#add('chrisbra/Recover.vim')
	call dein#add('stephpy/vim-yaml')
	call dein#add('spolu/dwm.vim')
	call dein#add('djoshea/vim-autoread')
	call dein#add('ElmCast/elm-vim')
	call dein#add('wannesm/wmgraphviz.vim', { 'on_ft': 'dot' })
	" Haskell
	call dein#add('ndmitchell/ghcid')
	call dein#add('neovimhaskell/haskell-vim')
	call dein#add('eagletmt/ghcmod-vim')
	" Python
	call dein#add('python-mode/python-mode')

 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif
	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

"filetype off                  " required

set number relativenumber
set backspace=indent,eol,start

" Status line
	" set laststatus=2 " always show
	" set statusline=%f\ %m\ %B
	" :h mode() to see all modes
	let g:currentmode={
		\ 'n'      : 'N ',
		\ 'no'     : 'N·Operator Pending ',
		\ 'v'      : 'V ',
		\ 'V'      : 'V·Line ',
		\ '\<C-V>' : 'V·Block ',
		\ 's'      : 'Select ',
		\ 'S'      : 'S·Line ',
		\ '\<C-S>' : 'S·Block ',
		\ 'i'      : 'I ',
		\ 'R'      : 'R ',
		\ 'Rv'     : 'V·Replace ',
		\ 'c'      : 'Command ',
		\ 'cv'     : 'Vim Ex ',
		\ 'ce'     : 'Ex ',
		\ 'r'      : 'Prompt ',
		\ 'rm'     : 'More ',
		\ 'r?'     : 'Confirm ',
		\ '!'      : 'Shell ',
		\ 't'      : 'Terminal '
		\}

	" Find out current buffer's size and output it.
	function! FileSize()
	  let bytes = getfsize(expand('%:p'))
	  if (bytes >= 1024)
		let kbytes = bytes / 1024
	  endif
	  if (exists('kbytes') && kbytes >= 1000)
		let mbytes = kbytes / 1000
	  endif

	  if bytes <= 0
		return '0'
	  endif

	  if (exists('mbytes'))
		return mbytes . 'MB '
	  elseif (exists('kbytes'))
		return kbytes . 'KB '
	  else
		return bytes . 'B '
	  endif
	endfunction

	function! ReadOnly()
	  if &readonly || !&modifiable
		return ''
	  else
		return ''
	endfunction

	set laststatus=2
	set statusline=
	set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
	set statusline+=%0*\ [%n]                                " buffernr
	set statusline+=%0*\ %<%f\ %{ReadOnly()}\ %m\ %w\        " File+path
	set statusline+=%#warningmsg#
	set statusline+=%*
	set statusline+=%9*\ %=                                  " Space
	set statusline+=%8*\ %y\                                 " FileType
	set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
	set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
	set statusline+=%0*\ %3p%%\ \ %l:\ %3B\                 " Rownumber/total (%)

let g:deoplete#enable_at_startup = 1
set hidden
set ignorecase
set copyindent

" Smooth scrolling
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Neosnippets
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Conceal markers can create difficult errors.
let g:neosnippet#enable_conceal_markers = 0

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#snippets_directory='~/.vim/snippets'

" deoplete
function! s:deoplete_lazy_enable()
 autocmd! deoplete_lazy_enable
 augroup! deoplete_lazy_enable
 call deoplete#enable()
endfunction
augroup deoplete_lazy_enable
 autocmd!
 autocmd CursorHold * call s:deoplete_lazy_enable()
 autocmd InsertEnter * call s:deoplete_lazy_enable()
       \ | silent! doautocmd <nomodeline> deoplete InsertEnter
augroup END
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('emoji', 'filetypes', ['golang'])

" tab complete
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Go language support
let g:go_fmt_autosave = 1 " disable gofmt because we have ale
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_build_tags = "integration"
let g:go_guru_tags = "integration"
nnoremap <C-A-D> :GoDoc<CR>
nnoremap <Leader>s :Denite decls:%<CR>
nnoremap <F2> :GoRename 

" Allows vim-go to show function signature where mode would normally appear.
" Mode is already shown by the status line.
set noshowmode 

" function! go#cmd#autowrite() abort
"   if &autowrite == 1 || &autowriteall == 1
"     silent! wall
"   else
"     for l:nr in range(0, bufnr('$'))
"       if buflisted(l:nr) && getbufvar(l:nr, '&modified')
"         " Sleep one second to make sure people see the message. Otherwise it is
"         " often immediacy overwritten by the async messages (which also don't
"         " invoke the "hit ENTER" prompt).
"         call go#util#EchoWarning('[No write since last change]')
"         return
"       endif
"     endfor
"   endif
" endfunction

" Rust related settings "
let g:rustfmt_autosave = 1
autocmd BufNewFile,BufRead *.rs set filetype=rust
let g:racer_cmd = "/path/to/racer/bin"
let g:racer_experimental_completer = 1

" ASM related settings "
autocmd BufNewFile,BufRead *.s set filetype=nasm

set hlsearch

" Default copying to system clipboard "
set clipboard=unnamedplus
" let g:loaded_clipboard_provider = 1

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

set showcmd
set path+=**

set wildmenu

" File Tree
map <C-w><C-t> :NERDTreeToggle<CR>
map <C-t> :NERDTreeFocus<CR>


filetype plugin indent on    " required

" Replace selected text within visual mode via Ctrl+R 
vnoremap // y/<C-R>"<CR>

"AESTHETICS"

set termguicolors
" colorscheme ammar
set background=dark
colorscheme PaperColor
let g:airline_theme='PaperColor'
let g:lightline = { 'colorscheme': 'PaperColor' }

" Move around windows w/ alt + arrow key
	" fit more code on screen w/ smaller tabs
	set tabstop=4
	set shiftwidth=4

	set incsearch
	syntax on

	" Split/window management
	" nnoremap <C-J> <C-W><C-J>
	" nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>
	" nnoremap <C-x> :q<CR> " Quickly exit buffer
	nnoremap <Leader>b :b#<CR> " Quickly go to previous buffer
	nnoremap <C-<gt>> :vertical resize +10<CR>

	nnoremap <C-p> :Denite file/rec<CR>
	nnoremap <C-b> :Denite buffer<CR>
	call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
	call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
	call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
	call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

" Async linting/errors
"
" nnoremap <C-p> :Denite file/rec<CR>
nnoremap <C-A-E> :ALENextWrap<CR>
let g:ale_list_window_size = 3

" Git support
set updatetime=1000 "We want our git gutter to update almost immediately.
autocmd VimEnter * let g:gitgutter_enabled = 1
autocmd VimEnter * :GitGutterEnable

" ALE
let g:ale_open_list = 1
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
" let g:ale_linters = {
" \ 'go': [ ''],
" \}
let g:ale_go_gometalinter_options = "--fast"

" Syntax highlighting
	" Debug syntax highlighting	
	map <C-A-H> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
	\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
	\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Buffer management
noremap <C-A-p> :b 
" Stop accidently exiting buffers.
noremap <C-c> <Tab>

" Folding confused my simple mind.
set diffopt+=context:99999

" Detect bash from shebang
function! DetectBash()
   if getline(1) =~ '#!\/bin\/bash'
     setfiletype sh
   endif
endfunction

augroup filetypedetect
  au BufRead,BufNewFile * call DetectBash()
augroup END

" Clear search
nnoremap <Leader>s :noh<CR>

" Disable text concealling. This is normally highly confusing.
set conceallevel=0

" Simpler terminal escape
" unmap C-x because it defaults to decrementing a number, which is obnoxious.
nnoremap <C-x> <Nop>
tnoremap <C-x> <C-\><C-N>

" Graphviz
noremap <Leader>g :GraphvizInteractive <CR>

set smartcase

" 80 char line indiciation
set colorcolumn=80

" Command mode navigation
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
