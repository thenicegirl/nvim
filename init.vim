
" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ===
" === Editor bebavior
" ===
set encoding=UTF-8
" set exrc
" set secure
set number
set relativenumber
" autocmd VimEnter,WinEnter * setlocal cursorline
" autocmd VimEnter,WinEnter * setlocal cursorcolumn
" autocmd WinLeave * setlocal nocursorline
" autocmd WinLeave * setlocal nocursorcolumn
set cursorline
set cursorcolumn
" set hidden
" set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
" set listchars=tab:\|\ ,trail:▫
set scrolloff=4
" set ttimeoutlen=0
" set viewoptions=cursor,folds,slash,unix
" set wrap
" set textwidth=0
" set indentexpr=
" set foldmethod=indent
" set foldlevel=99
" set foldenable
" set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
"set wildmenu
set ignorecase
set smartcase
"set shortmess+=c
"set inccommand=split
"set completeopt=longest,noinsert,menuone,noselect,preview
"set ttyfast "should make scrolling faster
"set lazyredraw "same as above
"set visualbell
"silent !mkdir -p ~/.config/nvim/tmp/backup
"silent !mkdir -p ~/.config/nvim/tmp/undo
""silent !mkdir -p ~/.config/nvim/tmp/sessions
"set backupdir=~/.config/nvim/tmp/backup,.
"set directory=~/.config/nvim/tmp/backup,.
"if has('persistent_undo')
"	set undofile
"	set undodir=~/.config/nvim/tmp/undo,.
"endif
"set colorcolumn=100
"set updatetime=100
"set virtualedit=block

"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Set Caps_Lock as Escape while using vim
autocmd VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
autocmd VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" autocmd BufWritePre * :%s/\s\+$//e
if executable("ruby")
	autocmd BufRead, BufNewFile *.rb noremap <F5> :% w !ruby -w<Enter>
else
	autocmd BufRead, BufNewFile *.rb noremap <F5> :echo "You need to install ruby first!"
endif
" autocmd BufRead, BufNewFile *.js noremap <F5> :% w !node<Enter>


set pastetoggle=<F2>
set hlsearch

set colorcolumn=120


" ===
" === Basic Mappings
" ===
" Disable cursor keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Set <Leader> as <Space>, ; as :
let mapleader=" "
" let g:mapleader=','
" noremap ; :

" Save & quit
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>w :w<CR>
" Source & PlugInstall
nnoremap <leader>ww :w<CR>:source ~/.config/nvim/init.vim<cr>
nnoremap <leader>W :PlugInstall<cr>

" Open the vimrc file anytime
nnoremap <Leader>rc :e ~/.config/nvim/init.vim<CR>
" noremap <LEADER>rv :e .nvimrc<CR>

" Make the vimrc effective immediately
"autocmd BufReadPost $MYVIMRC source $MYVIMRC

" Copy to system clipboard
" vnoremap y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
" Paste from clipboard
inoremap <A-p> <C-o>"+p

" Indentation
nnoremap < <<
nnoremap > >>

" Search
nnoremap <Leader><CR> :nohlsearch<CR>

" Adjacent duplicate words
nnoremap <Leader>dw /\(\<\w\+\>)\_s*\1

" Space to Tab
nnoremap <Leader>tt :%s/    /\t/g
vnoremap <Leader>tt :s/    /\t/g

" Folding
nnoremap <silent> <Leader>o za

" nnoremap <c-n> :tabe<CR>:-tabmove<CR>:term lazynpm<CR>

" My mappings
" Normal mappings
nnoremap H ^
nnoremap J <C-d>
nnoremap K <C-u>
nnoremap L $

nnoremap <C-h> 0
nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>

" Join
nnoremap <A-j> J
nnoremap <A-k> kddpkJ

nnoremap <Leader>h K

" Insert mappings
inoremap jj <Esc>`^
inoremap jk <Esc>`^:w<CR>

" Alt + h/j/k/l to move in insert mode
" inoremap <A-h> <C-o>h
inoremap <A-h> <Left>
" inoremap <A-j> <C-g>j
inoremap <A-j> <Down>
" inoremap <A-k> <C-g>k
inoremap <A-k> <Up>
" inoremap <A-l> <C-o>l
inoremap <A-l> <Right>

inoremap <C-i> <Del>
inoremap <C-m> <Esc>o
inoremap <C-g>h <Esc>I
inoremap <C-g>H <C-u>
inoremap <C-g>j <Esc>o
inoremap <C-g>k <Esc>O
inoremap <C-g>l <Esc>A
inoremap <C-g>L <Esc>c$
inoremap <C-g>u <Esc>ui
inoremap <C-x><C-x> <C-x><C-o>

" Alt+u to switch case
inoremap <A-u> <esc>gUiwea

inoremap <C-a> CtrlA
inoremap <CS-a> CtrlShiftA
inoremap <C-Up> CtrlUp
inoremap <C-S-Up> CtrlShiftUp

inoremap <Space><Space> <Esc>/<++><Enter>"_c4l

" map <ESC>[65;5u   :echo "ctrl-shift-b received"<CR>
" map <ESC>[70;5u   :echo "ctrl-shift-f received"<CR>
" map <C-b>         :echo "ctrl-b received"<CR>
" map <C-f>         :echo "ctrl-f received"<CR>

map <F6> :setlocal spell! spelllang=en_us<CR>

" Switch buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>

" Use ctrl + h/j/k/l to switch window
" noremap <C-h> <C-w>h
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" json Format
command! FormatJSON %!python3 -m json.tool


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" ===
" === Special
" ===
" :OpenPluginPage to view github page of current plugin.
Plug 'stsewd/open-plugin-page.nvim', { 'for': 'vim', 'do': ':UpdateRemotePlugins' }

" Fix terminal Ctrl Alt Shift modifiers for keys like Tab CR Space BS cursor
" and others.
" Plug 'powerman/vim-plugin-fixtermkeys'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ===
" === Color schemes
" ===
Plug 'w0ng/vim-hybrid'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'vim-scripts/wombat256.vim'

" Plug 'dracula/dracula-theme'

" ===
" === Util
" ===
" startify
Plug 'mhinz/vim-startify'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NERDTree
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kien/rainbow_parentheses.vim'

" CtrlP
Plug 'kien/ctrlp.vim'

" easymotion
Plug 'easymotion/vim-easymotion'
thenicegirl
" Vim Tmux Navigator
" Plug 'christoomey/vim-tmux-navigator' " <C-h> <C-j> <C-k> <C-l> <C-\>

" Surround
Plug 'tpope/vim-surround' " ys(you surround) {motion} {inner/around} {char}
Plug 'tpope/vim-repeat'

Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'brooth/far.vim'

" Completion
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif


" ===
" === Programming Language
" ===

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" CSS
Plug 'ap/vim-css-color'

" Ruby
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-rails'
" Plug 'thoughtbot/vim-rspec'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

Plug 'preservim/tagbar'
Plug 'lfv89/vim-interestingwords'
Plug 'sbdchd/neoformat'
Plug 'dense-analysis/ale'

" Comment
Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'

" Git
Plug 'tpope/vim-fugitive' " :Git / :G
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" ===
" === Testing
" ===
Plug 'theniceboy/vim-calc'

" Not support yet
Plug 'vim/killersheep'

" Plug 'vim-scripts/matrix.vim--Yang'
Plug 'uguu-org/vim-matrix-screensaver'

Plug 'mileszs/ack.vim'

" Initialize plugin system
call plug#end()


colorscheme gruvbox

" Define SetTitle function, auto insert file head
func SetTitle()
 if &filetype == 'python'
   call setline(1, "\#!/usr/bin/env python")
   call setline(2, "\# -*- coding:utf-8 -*-")
   normal G
   normal o
   normal o
   call setline(5, "if __name__ == '__main__':")
   call setline(6, "  pass")
 endif
endfunc

