" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
nnoremap ,, :NERDTreeToggle<CR>
nnoremap ,. :NERDTreeFind<CR>

" let NERDTreeMinimalUI = 1
" let NERDTreeChDirMode = 2

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
			\ quit | endif


" Press ? for help
"
" m: NERDTreeMenu
" I: toggle hidden
" u: up to last folder
" C: to current folder
