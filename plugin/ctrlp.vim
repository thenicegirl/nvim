let g:ctrlp_map = '<C-p>'

" ctrlp, in ~/.agignore add one line node_nodules
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|tmp$',
	\ 'file': '\v\.(exe|so|dll|swp|pyc|pyo)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
if executable('ag')
	" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
	set grepprg=ag\ --nogroup\ --nocolor
	" Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
	" and .agignore. Ignores hidden files by default.
	let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
else
	"ctrl+p ignore files in .gitignore
	let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -typef']
endif

" " The Silver Searcher
" if executable('ag')
"   " Use ag over grep
"   set grepprg=ag\ --nogroup\ --nocolor

"   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

"   " ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
" endif
