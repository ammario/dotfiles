set nocompatible              " be iMproved, required
"filetype off                  " required

set number
syntax on
set backspace=indent,eol,start
set laststatus=2
set statusline+=%F
let g:neocomplete#enable_at_startup = 1
set hidden
set ignorecase

" Go related settings "
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Rust related settings "
let g:rustfmt_autosave = 1
autocmd BufNewFile,BufRead *.rs set filetype=rust
let g:racer_cmd = "/path/to/racer/bin"
let g:racer_experimental_completer = 1

" ASM related settings "
autocmd BufNewFile,BufRead *.s set filetype=nasm

set hlsearch
set clipboard=unnamedplus
set showcmd
set path+=**

set wildmenu

"Aliases"
:command Tree NERDTreeToggle 
:command Copy %y+

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'leafgarland/typescript-vim'

Bundle 'uarun/vim-protobuf'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Replace selected text within visual mode via Ctrl+R 
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"AESTHETICS"
" not sure why but I have to do this twice for it to run properly
"
colorscheme vividchalk
colorscheme vividchalk

