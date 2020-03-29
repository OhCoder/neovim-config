" Specify a directory for plugins
call plug#begin("~/.vim/plugged")

" NERDTree plug
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'

" EasyAlign
Plug 'junegunn/vim-easy-align'

" find && replace
Plug 'brooth/far.vim'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" git plug
Plug 'airblade/vim-gitgutter'

" fuzzy find files
Plug 'ctrlpvim/ctrlp.vim'

" solid language pack for vim
Plug 'sheerun/vim-polyglot'

call plug#end()

" NERDTree ignore
let g:NERDTreeIgnore = ['^node_modules$']

" NERDTree default open when nvim starts up. 
" ref: https://github.com/preservim/nerdtree#how-can-i-open-a-nerdtree-automatically-when-vim-starts-up-if-no-files-were-specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" CtrlP, When invoked without an explicit starting directory, CtrlP will set its local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'
" CtrlP, If a file is already open, open it again in a new pane instead of switching to the existing pane
let g:ctrlp_switch_buffer = 'et'

" true color
set termguicolors

" line number
set number

" set indent
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab

" config for gitgutter.
" ref: https://github.com/airblade/vim-gitgutter#getting-started
set updatetime=100
" always show signcolumn
set signcolumn=yes

" config for vim-javascript
" support jsdoc highlighting
let g:javascript_plugin_jsdoc = 1

" set encoding
set encoding=UTF-8

" set heighlight syntax
syntax on

" turns on detection, plugin and indent at once
filetype plugin indent on

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

inoremap jk <ESC>

" config for vim-gitgutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" config NERDTree && NERDCommenterToggle
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
