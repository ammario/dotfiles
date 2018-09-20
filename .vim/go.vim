" Go related settings "
let g:go_fmt_autosave = 0 " disable gofmt because we have ale

let g:go_fmt_command = "goimports"
let g:go_gocode_unimported_packages = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Without this, GoDef is quite slow.
let g:go_def_use_buffer = 1
let g:go_def_reuse_buffer = 1

map <F12> :GoDef<CR>
map <F10> :GoDoc<CR> <c-w><c-p>
map <F9> :GoDecls<CR>
map <F8> :GoDeclsDir<CR>
map <F7> :GoReferrers<CR>
map <F2> :GoRename 
