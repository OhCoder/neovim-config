" Specify a directory for plugins
call plug#begin("~/.vim/plugged")

" coc nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" NERDTree plug
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" NERDCommenter
Plug 'scrooloose/nerdcommenter'

" WeChat syntax highlight
Plug 'chemzqm/wxapp.vim'

" LightLine
Plug 'itchyny/lightline.vim'

" nnn
Plug 'mcchrish/nnn.vim'

" vim-css-color
Plug 'ap/vim-css-color'

" vifm
Plug 'vifm/vifm.vim'

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

" surround
Plug 'tpope/vim-surround'

call plug#end()

" NERDTree ignore
let g:NERDTreeIgnore = ['^node_modules$']

let g:coc_node_path = '/Users/Haskell/.asdf/shims/node'

" NERDTree default open when nvim starts up. 
" ref: https://github.com/preservim/nerdtree#how-can-i-open-a-nerdtree-automatically-when-vim-starts-up-if-no-files-were-specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" nnn config begin
" Floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

" CtrlP, When invoked without an explicit starting directory, CtrlP will set its local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'
" CtrlP, If a file is already open, open it again in a new pane instead of switching to the existing pane
let g:ctrlp_switch_buffer = 'et'

" true color
set termguicolors

" improve scrolling performance when navigating through large results
set lazyredraw

" ignore case only when the pattern contains no capital letters
set ignorecase smartcase

" line number
set number

" set path based curent directory.
set path=.

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

" Alipay mini syntax highlight
augroup AlipayMini
  autocmd BufNewFile,BufRead *.acss set syntax=css
  autocmd BufNewFile,BufRead *.axml set syntax=html
augroup END

" set python3 host prog 
let g:python3_host_prog = '$HOME/.asdf/shims/python3'

" set clipboard
set clipboard+=unnamedplus

" set all number to decimal
set nrformats=

" for bash shell, set auto-complete menu
" set wildmode=longest,list

" for zsh, set auto-complete menu 
set wildmenu
set wildmode=full

" set history command list
set history=200

" set far.vim plugin
let g:far#enable_undo=1

" coc config begin
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc config end

" set encoding
set encoding=UTF-8

" set heighlight syntax
syntax on

" support mouse modify window size
set mouse=a

" set get current menu from '%:h' to %%
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

" open netrw plugin
set nocompatible

" check spell
set spell

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
